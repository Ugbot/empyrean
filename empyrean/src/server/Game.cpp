#include <stdexcept>
#include "Connection.h"
#include "Game.h"
#include "MapLoader.h"
#include "PacketTypes.h"
#include "PlayerBehavior.h"
#include "ServerAppearance.h"
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
                    instantiateBehavior("dumb"),
                    new ServerAppearance("cal3d", "models/Walk1/walk1.cfg"));
                entity->setPos(elt->pos);
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

        std::list<Entity*> list(_entities.begin(), _entities.end());
        for (size_t i = 0; i < _entities.size(); ++i) {
            _entities[i]->collideWithOthers(list);
        }

        for (size_t i = 0; i < _entities.size(); ++i) {
            ServerEntity* e = _entities[i];
            sendAll(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
        }
    }

    void Game::setData(Connection* c, ConnectionData* cd) {
        c->setOpaque(cd);
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
    
    EntityAddedPacket* Game::buildEntityAddedPacket(ServerEntity* entity) {
        return new EntityAddedPacket(
            entity->getID(),
            entity->getBehavior()->getName(),
            entity->getBehavior()->getResource(),
            entity->getAppearance()->getName(),
            entity->getAppearance()->getResource());
    }

    void Game::connectionAdded(Connection* connection) {
        PlayerBehavior* pb = new PlayerBehavior("");
        ServerEntity* entity = new ServerEntity(
            _idGenerator.reserve(),
            pb,
            new ServerAppearance("cal3d", "models/paladin/paladin.cfg"));
        entity->setPos(_startPosition);
        // Hardcoded for now.  Hardcoded in the client as well.
        float width  = 0.3f;
        float height = 1.9f;
        entity->setBounds(BoundingRectangle(Vec2f(-width / 2, 0), Vec2f(width / 2, height)));

        sendAll(buildEntityAddedPacket(entity));

        // Set connection-specific data.
        ConnectionData* cd = new ConnectionData;
        cd->playerEntity = entity;
        cd->behavior = pb;
        setData(connection, cd);

        // Add packet handlers.
        connection->definePacketHandler(this, &Game::handlePlayerEvent);

        addEntity(entity);

        // Send all existing entities to the new connection.
        for (size_t i = 0; i < _entities.size(); ++i) {
            connection->sendPacket(buildEntityAddedPacket(_entities[i]));
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
        // Don't need to delete the behavior, because the entity does that for us.
        delete cd;

        connection->clearHandlers();
        connection->setOpaque(0);
    }

    void Game::handlePlayerEvent(Connection* c, PlayerEventPacket* p) {
        ConnectionData* cd = getData(c);
        PlayerBehavior* behavior = cd->behavior;
        Entity* entity = cd->playerEntity;
        behavior->handleEvent(entity, p->event());
    }
    
}
