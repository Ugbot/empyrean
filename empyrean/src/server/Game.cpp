#include <stdexcept>
#include "Connection.h"
#include "Game.h"
#include "MapLoader.h"
#include "PacketTypes.h"
#include "ServerEntity.h"

namespace pyr {

    Game::Game(const std::string& name, const std::string& password) {
        _name = name;
        _password = password;

        _map = loadMap("maps/map1.obj");
        if (!_map) {
            throw std::runtime_error("Loading maps/map1.obj failed");
        }

        // Find start position.
        MapElementPtr start = _map->findElementByName("start");
        if (start) {
            _startPosition = start->pos;
        }

        // Find monsters.
        std::vector<MapElementPtr> elements;
        _map->getAllElements(elements);
        for (size_t i = 0; i < elements.size(); ++i) {
            MapElementPtr elt = elements[i];
            if (elt->properties["enemy"] == "true") {
                ServerEntity* entity = new ServerEntity(
                    _idGenerator.reserve(),
                    "models/Walk1/walk1.cfg");
                // Add AI.
                addEntity(entity);
            }
        }
    }

    Game::~Game() {
        clearConnections();

        for_each(_entities.begin(), _entities.end(), delete_function<ServerEntity>);
        _entities.clear();
    }

    void Game::update(float dt) {
        ConnectionHolder::update();

        for (size_t i = 0; i < _entities.size(); ++i) {
            _entities[i]->update(dt, _map.get());
        }

        for (size_t i = 0; i < _entities.size(); ++i) {
            ServerEntity* e = _entities[i];
            sendAll(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
        }
    }

    Game::ConnectionData* Game::getData(Connection* c) {
        return static_cast<ConnectionData*>(c->getOpaque());
    }

    void Game::addEntity(ServerEntity* entity) {
        _entities.push_back(entity);
    }

    void Game::removeEntity(ServerEntity* entity) {
        for (size_t i = 0; i < _entities.size(); ++i) {
            if (_entities[i] == entity) {
                _entities.erase(_entities.begin() + i);
                return;
            }
        }
    }

    void Game::connectionAdded(Connection* connection) {
        ServerEntity* entity = new ServerEntity(
            _idGenerator.reserve(),
            "models/paladin/paladin.cfg");
        entity->setPos(_startPosition);

        sendAll(new EntityAddedPacket(
                    entity->getID(),
                    entity->getAppearance()));

        // set connection-specific data
        ConnectionData* cd = new ConnectionData;
        cd->playerEntity = entity;
        connection->setOpaque(cd);

        // add packet handlers
        connection->definePacketHandler(this, &Game::handlePlayerEvent);

        addEntity(entity);

        // send all existing entities to the new connection
        for (size_t i = 0; i < _entities.size(); ++i) {
            connection->sendPacket(new EntityAddedPacket(
                _entities[i]->getID(),
                _entities[i]->getAppearance()));
        }

        connection->sendPacket(new SetPlayerPacket(entity->getID()));
    }

    void Game::connectionRemoved(Connection* connection) {
        ConnectionData* cd = getData(connection);
        PYR_ASSERT(cd, "connectionRemoved() called before connectionAdded()");

        sendAll(new EntityRemovedPacket(cd->playerEntity->getID()));
        connection->sendPacket(new EntityRemovedPacket(
                                   cd->playerEntity->getID()));

        _idGenerator.release(cd->playerEntity->getID());
        removeEntity(cd->playerEntity);
        delete cd->playerEntity;
        delete cd;

        connection->clearHandlers();
        connection->setOpaque(0);
    }

    void Game::handlePlayerEvent(Connection* c, PlayerEventPacket* p) {
        ConnectionData* cd = getData(c);
        ServerEntity* entity = cd->playerEntity;

        const float speed = 2;

        switch (p->code()) {
            case PE_BEGIN_RIGHT:
                entity->getVel()[0] = speed;
                break;
                
            case PE_BEGIN_LEFT:
                entity->getVel()[0] = -speed;
                break;
                
            case PE_END_RIGHT:
            case PE_END_LEFT:
                entity->getVel()[0] = 0;
                break;
                
            case PE_JUMP:
                entity->getVel()[1] = 8;
                break;
                
            case PE_ATTACK:
                break;
        }
    }
    
}
