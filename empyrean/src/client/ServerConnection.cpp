#include "Connection.h"
#include "EntityAddedPacket.h"
#include "EntityRemovedPacket.h"
#include "LoginPacket.h"
#include "LoginResponsePacket.h"
#include "Model.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "Scene.h"
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
    
    ServerConnection::ServerConnection() {
        _scene = 0;
        _loggedIn = false;
        _entityID = -1;
    }
    
    void ServerConnection::connect(
        const std::string& server,
        int port,
        Scene* scene)
    {
        _connection = new Connection(new Socket(server, port));
        _connection->definePacketHandler(this, &ServerConnection::handleLoginResponse);
        _connection->definePacketHandler(this, &ServerConnection::handleEntityAdded);
        _connection->definePacketHandler(this, &ServerConnection::handleEntityRemoved);
        _connection->definePacketHandler(this, &ServerConnection::handleUpdate);
        
        _scene = scene;
    }
    
    void ServerConnection::disconnect() {
        _connection = 0;
        _scene = 0;
        _loggedIn = false;
        _entityID = -1;
    }
    
    bool ServerConnection::isConnected() {
        return (_connection && !_connection->isClosed());
    }
    
    void ServerConnection::login(
        const std::string& user,
        const std::string& pass)
    {
        if (_connection) {
            _connection->sendPacket(new LoginPacket(user, pass));
        }
    }
    
    void ServerConnection::handleLoginResponse(Connection*, LoginResponsePacket* p) {
        _loggedIn = true;
        _entityID = p->getEntityID();
    }
            
    void ServerConnection::handleEntityAdded(Connection*, EntityAddedPacket* p) {
        Entity* entity = new PlayerEntity(
            new Model(p->getAppearance()),
            new CellShadeRenderer());
        entity->setPos(p->getPos());
        entity->setVel(p->getVel());
        
        _scene->addEntity(p->getEntityID(), entity);
    }
    
    void ServerConnection::handleEntityRemoved(Connection* c, EntityRemovedPacket* p) {
        _scene->removeEntity(p->getEntityID());
    }
    
    void ServerConnection::handleUpdate(Connection* c, UpdatePacket* p) {
        Entity* e = _scene->getEntity(p->getEntityID());
        if (e) {
            e->setPos(p->getPos());
            e->setVel(p->getVel());
        }
    }

}
