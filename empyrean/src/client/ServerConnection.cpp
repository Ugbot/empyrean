#include "Connection.h"
#include "PacketTypes.h"
#include "ServerConnection.h"
#include "ServerConnectionThread.h"
#include "Socket.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(ServerConnection)

   
    ServerConnection::ServerConnection() {
        _status = DISCONNECTED;
        _connectionMaker = 0;
        _loginFailed = false;
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

    bool ServerConnection::sendPacket(Packet* p) {
        if (_connection) {
            _connection->sendPacket(p);
            return true;
        } else {
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

}
