#include <iostream>
#include "Connection.h"
#include "LoginPacket.h"
#include "LoginResponsePacket.h"
#include "ScopedLock.h"
#include "UpdatePacket.h"
#include "World.h"


namespace pyr {

    World* World::_instance = 0;

    World& World::instance() {
        if (!_instance) {
            _instance = new World();
            atexit(destroy);
        }
        return *_instance;
    }
    
    void World::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    World::~World() {
        ScopedLock lock(_connectionsLock);
        while (!_connections.empty()) {
            removeConnection(0);
        }
    }
    
    void World::update(float dt) {
        ScopedLock lock(_connectionsLock);
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            ConnectionData* cd = (ConnectionData*)c->getOpaque();
            
            if (c->isClosed()) {
                removeConnection(i);
                continue;
            }
            c->processIncomingPackets();
            
            if (cd->loggedIn) {
                gmtl::Vec2f pos, vel;
                c->sendPacket(new UpdatePacket(0, pos, vel));
            }
        }
    }
    
    void World::addConnection(Connection* connection) {
        std::cout << "Connection!" << std::endl;
        
        ConnectionData* cd = new ConnectionData();
        cd->entityID = _uidGenerator.reserve();
        connection->setOpaque(cd);
        
        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);
    
        // add the connection to the list of connections
        ScopedLock lock(_connectionsLock);
        _connections.push_back(connection);
    }
    
    /**
     * Called inside of update(), so no need to lock _connections.
     */
    void World::removeConnection(unsigned index) {
        Connection* connection = _connections[index];
        
        ConnectionData* cd = (ConnectionData*)connection->getOpaque();
        _uidGenerator.release(cd->entityID);
        delete cd;
        
        _connections.erase(_connections.begin() + index);
        delete connection;
        
        std::cout << "Disconnected" << std::endl;
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        std::cout << "Login: "
                  << p->getUsername() << " | " << p->getPassword()
                  << std::endl;
                  
        ConnectionData* cd = (ConnectionData*)c->getOpaque();
        cd->loggedIn = true;
        c->sendPacket(new LoginResponsePacket(cd->entityID));
    }

}
