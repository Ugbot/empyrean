#include "Connection.h"
#include "LoginPacket.h"
#include "ServerConnection.h"
#include "Socket.h"
#include "UpdatePacket.h"


namespace pyr {

    ServerConnection* ServerConnection::_instance = 0;

    ServerConnection& ServerConnection::instance() {
        if (!_instance) {
            _instance = new ServerConnection();
            atexit(destroy);
        }
        return *_instance;
    }
    
    void ServerConnection::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    void ServerConnection::connectToServer(const std::string& server) {
        Socket* socket = new Socket(server, 8765);
        _connection = new Connection(socket);
        _connection->definePacketHandler(this, &ServerConnection::handleUpdate);
        _connection->sendPacket(new LoginPacket("aegis", "kazaa"));
    }
    
    bool ServerConnection::isConnected() {
        return (_connection && !_connection->isClosed());
    }
    
    void ServerConnection::handleUpdate(Connection* c, UpdatePacket* p) {
        // do stuff with p
    }

}
