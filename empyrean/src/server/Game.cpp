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
                    new ServerAppearance("cal3d", "models/Walk1/walk1.cfg"),
                    0);
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

            // Send all appearance updates to all of the clients.
            ServerAppearance* appearance = _entities[i]->getServerAppearance();
            std::vector<Packet*> packets;
            appearance->sendAppearanceChanges(_entities[i]->getID(), packets);
            for (size_t i = 0; i < packets.size(); ++i) {
                sendAll(packets[i]);
            }
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

    GameConnectionData* Game::getData(Connection* c) {
        return checked_cast<GameConnectionData*>(c->getData());
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
        // Not using checked_cast here because the error message wouldn't be as descriptive.
        ServerConnectionData* scd = dynamic_cast<ServerConnectionData*>(connection->getData());
        PYR_ASSERT(scd, "Connection data in game is not set.  Maybe connection " \
                        "was added to Game without going through Server?");

        GameConnectionData* cd = new GameConnectionData(*scd);

        PlayerBehavior* pb = new PlayerBehavior("");
        ServerEntity* entity = new ServerEntity(
            _idGenerator.reserve(),
            pb,
            new ServerAppearance("cal3d", "models/paladin/paladin.cal3d"),
            // Just pick a character.
            cd->account->getCharacter(0));
        entity->setPos(_startPosition);
        // Hardcoded for now.  Hardcoded in the client as well.
        float width  = 0.3f;
        float height = 1.9f;
        entity->setBounds(BoundingRectangle(Vec2f(-width / 2, 0), Vec2f(width / 2, height)));

        // Set connection-specific data.
        cd->playerEntity = entity;
        cd->behavior = pb;
        connection->setData(cd);

        // Add packet handlers.
        connection->definePacketHandler(this, &Game::handlePlayerEvent);
        connection->definePacketHandler(this, &Game::handleHUDUpdate);

        addEntity(entity);

        // Add player entity to other clients.
        sendAll(buildEntityAddedPacket(entity));

        // Send all entities to the new connection.
        for (size_t i = 0; i < _entities.size(); ++i) {
            connection->sendPacket(buildEntityAddedPacket(_entities[i]));
        }
        
        connection->sendPacket(new SetPlayerPacket(entity->getID()));

        // Send the client its character stats
        connection->sendPacket(new CharacterUpdatedPacket( entity->getID(),
                                                           entity->getCharacter()->getCurrentVitality(),
                                                           entity->getCharacter()->getMaxVitality(),
                                                           entity->getCharacter()->getCurrentEther(),
                                                           entity->getCharacter()->getMaxEther()        ));
    }

    void Game::connectionRemoved(Connection* connection) {
        GameConnectionData* cd = getData(connection);
        PYR_ASSERT(cd, "No ConnectionData.  connectionRemoved() called before connectionAdded()?");

        sendAll(new EntityRemovedPacket(cd->playerEntity->getID()));
        connection->sendPacket(new EntityRemovedPacket(
                                   cd->playerEntity->getID()));

        _idGenerator.release(cd->playerEntity->getID());
        removeEntity(cd->playerEntity);
        delete cd->playerEntity;
        // Don't need to delete the behavior, because the entity does that for us.

        // Maybe this will need to specifically unregister handlers as
        // opposed to clearing them all.
        connection->clearHandlers();
    }

    void Game::handlePlayerEvent(Connection* c, PlayerEventPacket* p) {
        GameConnectionData* cd = getData(c);
        PlayerBehavior* behavior = cd->behavior;
        Entity* entity = cd->playerEntity;
        behavior->handleEvent(entity, p->event());
    }

    void Game::handleHUDUpdate(Connection* c, TempHUDPacket* p) {
        // Update the character
        GameConnectionData* cd = getData(c);
        ServerEntity* entity = dynamic_cast<ServerEntity*>(cd->playerEntity);
        entity->getCharacter()->changeVitality(p->addVit() == 0 ? -p->decVit() : p->addVit());
        entity->getCharacter()->changeEther(p->addEth() == 0 ? -p->decEth() : p->addEth());

        // Send the change
        c->sendPacket(new CharacterUpdatedPacket( entity->getID(),
                                                  entity->getCharacter()->getCurrentVitality(),
                                                  entity->getCharacter()->getMaxVitality(),
                                                  entity->getCharacter()->getCurrentEther(),
                                                  entity->getCharacter()->getMaxEther()        ));
    }

}
