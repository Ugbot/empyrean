#include "Connection.h"
#include "Model.h"
#include "PacketTypes.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "Scene.h"
#include "ServerConnection.h"
#include "ServerConnectionThread.h"
#include "Socket.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(ServerConnection)

   
    ServerConnection::ServerConnection() {
        _status = DISCONNECTED;
        _connectionMaker = 0;
        _loginFailed = false;
        
        _hasJoinGameResponse = false;
        _joinGameResponse = 0;
        
        _hasNewCharacterResponse = false;
        _newCharacterResponse = 0;
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
                _connection->definePacketHandler(this, &ServerConnection::handleLoginResponse);
                _connection->definePacketHandler(this, &ServerConnection::handleLobby);
                _connection->definePacketHandler(this, &ServerConnection::handleJoinGameResponse);
                _connection->definePacketHandler(this, &ServerConnection::handleNewCharacterResponse);
                _connection->definePacketHandler(this, &ServerConnection::handleEntityAdded);
                _connection->definePacketHandler(this, &ServerConnection::handleEntityRemoved);
                _connection->definePacketHandler(this, &ServerConnection::handleEntityUpdated);                
                
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
    
    bool ServerConnection::newCharacter(const std::string& name) {
        _hasNewCharacterResponse = false;
        _newCharacterResponse = 0;
        return sendPacket(new NewCharacterPacket(name));
    }

    bool ServerConnection::setVelocity(const gmtl::Vec2f& vel) {
        return sendPacket(new SetVelocityPacket(vel));
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
    
    void ServerConnection::handleNewCharacterResponse(Connection*, NewCharacterResponsePacket* p) {
        _hasNewCharacterResponse = true;
        _newCharacterResponse = p->code();
    }

    void ServerConnection::handleEntityAdded(Connection*, EntityAddedPacket* p) {
        PlayerEntity* entity = new PlayerEntity(
            new Model(p->appearance()),
            new DefaultRenderer(),
            0);
        Scene::instance().addEntity(p->id(), entity);
    }

    void ServerConnection::handleEntityRemoved(Connection*, EntityRemovedPacket* p) {
        Scene& s = Scene::instance();
        Entity* entity = s.getEntity(p->id());
        if (entity) {
            s.removeEntity(p->id());
            delete entity;
        }
    }

    void ServerConnection::handleEntityUpdated(Connection*, EntityUpdatedPacket* p) {
        Entity* entity = Scene::instance().getEntity(p->id());
        if (entity) {
            entity->setPos(p->pos());
            entity->setVel(p->vel());
        }
    }

}
