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
    
    void World::update(float dt) {
    }
    
    void World::addConnection(Connection* connection) {
        _connections.push_back(connection);
    }
    
    void World::removeConnection(Connection* connection) {
        _connections.remove(connection);
    }

}
