#include <iostream>
#include "Connection.h"
#include "LoginPacket.h"
#include "ScopedLock.h"
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
        for (unsigned i = 0; i < _connections.size(); ++i) {
            delete _connections[i];
        }
        _connections.clear();
    }
    
    void World::update(float dt) {
        ScopedLock lock(_connectionsLock);
        for (unsigned i = 0; i < _connections.size(); ++i) {
            if (_connections[i]->isClosed()) {
                _connections.erase(_connections.begin() + i);
                std::cout << "Disconnected" << std::endl;
                continue;
            }
            _connections[i]->processIncomingPackets();
        }
    }
    
    void World::addConnection(Connection* connection) {
        std::cout << "Connection!" << std::endl;
        
        connection->definePacketHandler<LoginPacket, World>(this, &World::handleLogin);
    
        ScopedLock lock(_connectionsLock);
        _connections.push_back(connection);
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        std::cout << "Login: "
                  << p->getUsername() << " | " << p->getPassword()
                  << std::endl;
    }

}
