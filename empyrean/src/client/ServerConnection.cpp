#include "Connection.h"
#include "Model.h"
#include "PacketTypes.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "Scene.h"
#include "ServerConnection.h"
#include "Socket.h"


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
    
    ServerConnection::ServerConnection() {
        _loggedIn = false;
        _entityID = -1;
	_force = 0;
    }
    
    void ServerConnection::connect(
        const std::string& server,
        int port)
    {
        _connection = new Connection(new Socket(server, port));
        _connection->definePacketHandler(this, &ServerConnection::handleLoginResponse);
        _connection->definePacketHandler(this, &ServerConnection::handleEntityAdded);
        _connection->definePacketHandler(this, &ServerConnection::handleEntityRemoved);
        _connection->definePacketHandler(this, &ServerConnection::handleUpdate);
    }
    
    void ServerConnection::disconnect() {
        _connection = 0;
        _loggedIn = false;
        _entityID = -1;
    }
    
    bool ServerConnection::isConnected() {
        return (_connection && !_connection->isClosed());
    }
    
    void ServerConnection::update() {
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

    void ServerConnection::setForce(float force) {
	if (force != _force) {
	    std::cout << "Sending force: " << force << std::endl;
	    sendPacket(new PlayerStatePacket(force));
	    _force = force;
	}
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
            _loggedIn = true;
        }
    }

    void ServerConnection::handleEntityAdded(Connection*, EntityAddedPacket* p) {
	std::cout << "Adding entity: " << p->entityID() << std::endl;

        Entity* entity = new PlayerEntity(
            new Model(p->appearance()),
            new DefaultRenderer());
//            new CellShadeRenderer());
        entity->setPos(p->pos());
        entity->setVel(p->vel());
        
        Scene::instance().addEntity(p->entityID(), entity);
    }
    
    void ServerConnection::handleEntityRemoved(Connection* c, EntityRemovedPacket* p) {
	std::cout << "Removing entity: " << p->entityID() << std::endl;
        Scene::instance().removeEntity(p->entityID());
    }
    
    void ServerConnection::handleUpdate(Connection* c, UpdatePacket* p) {
	std::cout << "handleUpdate()" << std::endl;
        Entity* e = Scene::instance().getEntity(p->entityID());
        if (e) {
            e->setPos(p->pos());
            e->setVel(p->vel());
        } else {
            std::cout << "Ignoring update packet with invalid entity id" << std::endl;
        }
    }

}
