#include <iostream>
#include "Connection.h"
#include "EntityAddedPacket.h"
#include "EntityRemovedPacket.h"
#include "LoginPacket.h"
#include "LoginResponsePacket.h"
#include "PlayerStatePacket.h"
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
        // update entities
        for (EntityMap::iterator itr = _entities.begin();
             itr != _entities.end(); ++itr)
        {
            itr->second->update(dt);
        }
        
        // update connections
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            
            // if the connection is dead, it must be removed
            if (c->isClosed()) {
                removeConnection(i);
                continue;
            }
            
            c->processIncomingPackets();
            
            // if the connection is logged in, update all entities
            ConnectionData* cd = (ConnectionData*)c->getOpaque();
            if (cd->loggedIn) {
                for (EntityMap::iterator itr = _entities.begin();
                    itr != _entities.end(); ++itr)
                {
                    c->sendPacket(new UpdatePacket(
                        itr->first,
                        itr->second->getPos(),
                        itr->second->getVel()));
                }
            }
        }
    }
    
    void World::addConnection(Connection* connection) {
        std::cout << "Connection!" << std::endl;
        
        ConnectionData* cd = new ConnectionData();
        cd->loggedIn = false;
        cd->entityID = 0;
        connection->setOpaque(cd);
        
        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);
	connection->definePacketHandler(this, &World::handlePlayerState);
    
        // add the connection to the list of connections
        _connections.push_back(connection);
    }
    
    void World::removeConnection(unsigned index) {
        Connection* connection = _connections[index];
        
        ConnectionData* cd = (ConnectionData*)connection->getOpaque();
        if (cd->loggedIn) {
            removeEntity(cd->entityID);
            _uidGenerator.release(cd->entityID);
        }
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
            cd->entityID = _uidGenerator.reserve();
            c->sendPacket(new LoginResponsePacket(cd->entityID));
            
            // make sure this connection sees the other entities too
            for (EntityMap::iterator itr = _entities.begin();
                itr != _entities.end(); ++itr)
            {
                c->sendPacket(new EntityAddedPacket(
                    itr->second->getAppearance(),
                    itr->first,
                    itr->second->getPos(),
                    itr->second->getVel()));
            }
            
            // add new avatar entity to world
            ServerEntity* se = new ServerEntity();
            addEntity(cd->entityID, se);
        } else {
	    std::cout << "Already logged in!" << std::endl;
	}
    }

    void World::handlePlayerState(Connection* c, PlayerStatePacket* p) {
	std::cout << "handlePlayerState" << std::endl;
	ConnectionData* cd = (ConnectionData*)c->getOpaque();
	if (cd->loggedIn) {
	    std::cout << "Player state update" << std::endl;
	    ServerEntity* entity = getEntity(cd->entityID);
	    if (entity) {
		entity->setVel(gmtl::Vec2f(p->getForce() * 50, 0));
	    } else {
		std::cout << "- Unknown entity" << std::endl;
	    }
	}
    }
    
    void World::addEntity(u16 id, ServerEntity* entity) {
        PYR_ASSERT(_entities.count(id) == 0, "Entity can't be added twice");
        
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            ConnectionData* cd = (ConnectionData*)c->getOpaque();
            if (cd->loggedIn) {
                c->sendPacket(new EntityAddedPacket(
                    entity->getAppearance(),
                    id,
                    entity->getPos(),
                    entity->getVel()));
            }
        }
        _entities[id] = entity;
    }
    
    void World::removeEntity(u16 id) {
        PYR_ASSERT(_entities.count(id) >= 1, "Entity can't be removed twice");
        _entities.erase(id);
        
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            ConnectionData* cd = (ConnectionData*)c->getOpaque();
            if (cd->loggedIn) {
                c->sendPacket(new EntityRemovedPacket(id));
            }
        }
    }

    ServerEntity* World::getEntity(u16 id) {
	return (_entities.count(id) ? _entities[id] : 0);
    }

}
