#include "Connection.h"
#include "Game.h"
#include "ServerEntity.h"


namespace pyr {

    Game::Game(const std::string& name, const std::string& password) {
        _name = name;
        _password = password;
    }
    
    Game::~Game() {
        clearConnections();
    
        while (!_entities.empty()) {
            delete _entities[0];
            _entities.erase(_entities.begin());
        }
    }
    
    const std::string& Game::getName() const {
        return _name;
    }
    
    const std::string& Game::getPassword() const {
        return _password;
    }

    void Game::update(float dt) {
        for (size_t i = 0; i < _entities.size(); ++i) {
            _entities[i]->update(dt);
        }
    }
    
    void Game::connectionAdded(Connection* connection) {
    }
    
    void Game::connectionRemoved(Connection* connection) {
        connection->clearHandlers();
    }
    
}
