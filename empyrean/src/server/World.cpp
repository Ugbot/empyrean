#include <iostream>
#include "Connection.h"
#include "LoginPacket.h"
#include "LoginResponsePacket.h"
#include "ServerEntity.h"
#include "UpdatePacket.h"
#include "World.h"


namespace pyr {

    World::~World() {
        while (!_connections.empty()) {
            removeConnection(0);
        }
    }
    
    void World::update(float dt) {
        
    
    
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            
            // if the connection is dead, it must be removed
            if (c->isClosed()) {
                removeConnection(i);
                continue;
            }
            
            c->processIncomingPackets();
            
            ConnectionData* cd = (ConnectionData*)c->getOpaque();
            if (cd->loggedIn) {
                gmtl::Vec2f pos, vel;
                c->sendPacket(new UpdatePacket(0, pos, vel));
            }
        }
    }
    
    void World::addConnection(Connection* connection) {
        std::cout << "Connection!" << std::endl;
        
        ConnectionData* cd = new ConnectionData();
        cd->loggedIn = false;
        cd->entityID = _uidGenerator.reserve();
        connection->setOpaque(cd);
        
        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);
    
        // add the connection to the list of connections
        _connections.push_back(connection);
    }
    
    void World::removeConnection(unsigned index) {
        Connection* connection = _connections[index];
        
        ConnectionData* cd = (ConnectionData*)connection->getOpaque();
        if (cd->loggedIn) {
            removeEntity(cd->entityID);
        }
        _uidGenerator.release(cd->entityID);
        delete cd;
        
        _connections.erase(_connections.begin() + index);
        delete connection;
        
        std::cout << "Disconnected" << std::endl;
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        ConnectionData* cd = (ConnectionData*)c->getOpaque();
        if (!cd->loggedIn) {
            std::cout << "Login: "
                      << p->getUsername() << " | " << p->getPassword()
                      << std::endl;
                  
            cd->loggedIn = true;
            c->sendPacket(new LoginResponsePacket(cd->entityID));
            
            ServerEntity* se = new ServerEntity();
            addEntity(cd->entityID, se);
        }
    }
    
    void World::addEntity(u16 id, ServerEntity* entity) {
    }
    
    void World::removeEntity(u16 id) {
    }

}
