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
#if 0
        std::vector<MapElementPtr> elements;
        _map->getAllElements(elements);
        for (size_t i = 0; i < elements.size(); ++i) {
            MapElementPtr elt = elements[i];
            if (elt->properties["enemy"] == "true") {
                ServerEntity* entity = new ServerEntity(
                    _idGenerator.reserve(),
                    "models/Walk1/walk1.cfg",
                    instantiateBehavior("dumb"));
                entity->setPos(elt->pos);
                addEntity(entity);
            }
        }
#endif
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
            _entities[i]->collideWithOthers(_entities);
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
                    "cal3d",
                    entity->getAppearance(),
                    "player",
                    ""));

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
                "cal3d",
                _entities[i]->getAppearance(),
                "player",
                ""));
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

        if (p->event() == "Begin Right") {
            entity->getVel()[0] = speed;
        }
                
        if (p->event() == "Begin Left") {
            entity->getVel()[0] = -speed;
        }
             
        if (p->event() == "End Right" || p->event() == "End Left") {
            entity->getVel()[0] = 0;
        }
                
        if (p->event() == "Jump") {
            entity->getVel()[1] = 8;
        }
                
        if (p->event() == "Attack") {                
        }
    }
    
}
