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
    }
    
    void ServerConnection::beginConnecting(const std::string& server, int port) {
        _status = CONNECTING;
        _connectionMaker = new ServerConnectionThread(server, port);
        _connectionThread = new Thread(_connectionMaker, PR_PRIORITY_HIGH);
    }
    
    void ServerConnection::disconnect() {
        _connection = 0;
        _status = DISCONNECTED;
    }
    
    bool ServerConnection::isConnected() {
        return (_connection && !_connection->isClosed());
    }
    
    ServerConnection::Status ServerConnection::getStatus() {
        return _status;
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
    
    bool ServerConnection::login(
        const std::string& user,
        const std::string& pass,
        bool newuser)
    {
        return sendPacket(new LoginPacket(user, pass, newuser ? 1 : 0));
    }

    bool ServerConnection::sendPacket(Packet* p) {
        if (_connection) {
            _connection->sendPacket(p);
            return true;
        } else {
            return false;
        }
    }
            
    void ServerConnection::handleLoginResponse(Connection*, LoginResponsePacket* p) {
        if (p->response() == LR_LOGGED_IN) {
            _status = LOGGED_IN;
        }
    }

}
