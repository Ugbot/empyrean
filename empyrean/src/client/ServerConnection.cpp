#include "AppearanceFactory.h"
#include "ClientEntity.h"
#include "Connection.h"
#include "Model.h"
#include "PacketTypes.h"
#include "Scene.h"
#include "ServerConnection.h"
#include "ServerConnectionThread.h"
#include "Socket.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(ServerConnection)

    ServerConnection::ServerConnection() {
        definePacketHandler(this, &ServerConnection::handleLoginResponse);
        definePacketHandler(this, &ServerConnection::handleLobby);
        definePacketHandler(this, &ServerConnection::handleJoinGameResponse);
        definePacketHandler(this, &ServerConnection::handleSetPlayer);
        definePacketHandler(this, &ServerConnection::handleEntityAdded);
        definePacketHandler(this, &ServerConnection::handleEntityRemoved);
        definePacketHandler(this, &ServerConnection::handleEntityUpdated);
        definePacketHandler(this, &ServerConnection::handleAppearance);
        definePacketHandler(this, &ServerConnection::handleCharacterUpdate);
    }

    void ServerConnection::beginConnecting(const std::string& server, int port) {
        _status = CONNECTING;
        _loginFailed = false;
        _connectionMaker = new ServerConnectionThread(server, port);
        _connectionThread = new Thread(_connectionMaker, PR_PRIORITY_HIGH);
    }

    void ServerConnection::disconnect() {
        _connection = 0;
        _status = DISCONNECTED;
        _loginFailed = false;
    }

    bool ServerConnection::isConnected() {
        return (_connection && !_connection->isClosed());
    }

    ServerConnection::Status ServerConnection::getStatus() {
        return _status;
    }

    bool ServerConnection::loginFailed() {
        return _loginFailed;
    }

    const std::string& ServerConnection::getError() {
        return _error;
    }

    void ServerConnection::update() {
        if (_connectionMaker) {
            ServerConnectionThread::Status status = _connectionMaker->getStatus();
            if (status == ServerConnectionThread::CONNECT_SUCCEEDED) {

                _connection = new Connection(_connectionMaker->getSocket());
                _connection->addReceiver(this);

                _connectionMaker = 0;
                _connectionThread = 0;
                _status = CONNECTED;
                
            } else if (status == ServerConnectionThread::CONNECT_FAILED) {
                _error = _connectionMaker->getError();
                _status = DISCONNECTED;
                _connectionMaker = 0;
                _connectionThread = 0;
            }
        }
        
        if (_connection) {
            _connection->processIncomingPackets();
        }
    }

    std::vector<std::string> ServerConnection::getLobbyMessages() {
        std::vector<std::string> msgs = _lobbyMessages;
        _lobbyMessages.clear();
        return msgs;
    }
    
    bool ServerConnection::login(
        const std::string& user,
        const std::string& pass,
        bool newuser)
    {
        _loginFailed = false;
        _lobbyMessages.clear();
        return sendPacket(new LoginPacket(user, pass, newuser ? 1 : 0));
    }

    bool ServerConnection::say(const std::string& text) {
        return sendPacket(new SayPacket(text));
    }
    
    bool ServerConnection::joinGame(
        const std::string& name,
        const std::string& password,
        bool newGame)
    {
        _hasJoinGameResponse = false;
        _joinGameResponse = 0;
        return sendPacket(new JoinGamePacket(name, password, newGame ? 1 : 0));
    }
    
    bool ServerConnection::sendEvent(const std::string& event) {
        return sendPacket(new PlayerEventPacket(event));
    }

    bool ServerConnection::sendAttack(const std::string& attack) {
        return sendPacket(new PlayerAttackPacket(attack,"Melee"));
    }

    bool ServerConnection::sendPacket(Packet* p) {
        if (_connection) {
            _connection->sendPacket(p);
            return true;
        } else {
            delete p;
            return false;
        }
    }
    
    std::string getLRMessage(int response) {
        switch (response) {
            case LR_INVALID_USERNAME:  return "Invalid username";
            case LR_NO_ACCOUNT:        return "Invalid account";
            case LR_INVALID_PASSWORD:  return "Invalid password";
            case LR_ACCOUNT_TAKEN:     return "Account already taken";
            case LR_ALREADY_LOGGED_IN: return "Already logged in";
            default:                   return "";
        }
    }
            
    void ServerConnection::handleLoginResponse(Connection*, LoginResponsePacket* p) {
        if (p->response() == LR_LOGGED_IN) {
            _status = LOGGED_IN;
        } else {
            _loginFailed = true;
            _error = getLRMessage(p->response());
        }
    }
    
    void ServerConnection::handleLobby(Connection*, LobbyPacket* p) {
        std::string message;
        switch (p->action()) {
            case LOBBY_LOGIN:  message = p->username() + " logged in"; break;
            case LOBBY_LOGOUT: message = p->username() + " logged out"; break;
            case LOBBY_SAY:    message = p->username() + ": " + p->text(); break;
        }
        if (!message.empty()) {
            _lobbyMessages.push_back(message);
        }
    }

    void ServerConnection::handleJoinGameResponse(Connection*, JoinGameResponsePacket* p) {
        _hasJoinGameResponse = true;
        _joinGameResponse = p->code();
    }

    void ServerConnection::handleSetPlayer(Connection*, SetPlayerPacket* p) {
        the<Scene>().setFocus(p->id());
    }

    void ServerConnection::handleEntityAdded(Connection*, EntityAddedPacket* p) {
        ClientEntity* entity = new ClientEntity(
            instantiateBehavior(p->behavior(), p->behaviorResource()),
            instantiateAppearance(p->appearance(), p->appearanceResource()));
        // Hardcoded for now.  Hardcoded in the server as well.
        entity->setBounds(BoundingRectangle(p->boundsMin(), p->boundsMax()));
        the<Scene>().addEntity(p->id(), entity);
    }

    void ServerConnection::handleEntityRemoved(Connection*, EntityRemovedPacket* p) {
        EntityPtr entity = the<Scene>().getEntity(p->id());
        if (entity) {
            the<Scene>().removeEntity(p->id());
        } else {
            PYR_LOG() << "Received remove entity packet for nonexistent entity " << p->id();
        }
    }

    void ServerConnection::handleEntityUpdated(Connection*, EntityUpdatedPacket* p) {
        EntityPtr entity = the<Scene>().getEntity(p->id());
        if (entity) {
            entity->setPos(p->pos());
            entity->setVel(p->vel());
        } else {
            PYR_LOG() << "Received update entity packet for nonexistent entity " << p->id();
        }
    }

    void ServerConnection::handleAppearance(Connection*, AppearancePacket* p) {
        EntityPtr entity = the<Scene>().getEntity(p->id());
        if (entity) {
            Appearance* appearance = entity->getAppearance();
            switch (p->code()) {
                case AP_COMMAND:         appearance->sendCommand(p->str()); break;
                case AP_ANIMATION:       appearance->beginAnimation(p->str()); break;
                case AP_ANIMATION_CYCLE: appearance->beginAnimationCycle(p->str()); break;
                default:
                    PYR_LOG() << "Unknown code in appearance packet:";
                    p->log();
                    break;
            }
        } else {
            PYR_LOG() << "Received appearance packet for nonexistent entity " << p->id();
        }
    }

    void ServerConnection::handleCharacterUpdate(Connection*, CharacterUpdatedPacket* p) {
        ClientEntityPtr entity = the<Scene>().getEntity(p->id());
        if (entity) {
            entity->setCurrentVitality(p->currVit());
            entity->setMaxVitality(p->maxVit());
            entity->setCurrentEther(p->currEth());
            entity->setMaxEther(p->maxEth());
        } else {
            PYR_LOG() << "Received update entity packet for nonexistent entity " << p->id();
        }
    }

}
