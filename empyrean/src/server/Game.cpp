#include "Connection.h"
#include "Game.h"
#include "PacketTypes.h"
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
        ConnectionHolder::update();

        for (size_t i = 0; i < _entities.size(); ++i) {
            _entities[i]->update(dt);
        }
        for (size_t i = 0; i < getConnectionCount(); ++i) {
            getData(getConnection(i))->playerEntity->update(dt);
        }

        for (size_t i = 0; i < _entities.size(); ++i) {
            ServerEntity* e = _entities[i];
            sendAll(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
        }
        for (size_t i = 0; i < getConnectionCount(); ++i) {
            ServerEntity* e = getData(getConnection(i))->playerEntity;
            sendAll(new EntityUpdatedPacket(
                        e->getID(), e->getPos(), e->getVel()));
        }
    }

    Game::ConnectionData* Game::getData(Connection* c) {
        return static_cast<ConnectionData*>(c->getOpaque());
    }
    
    void Game::connectionAdded(Connection* connection) {
        ServerEntity* entity = new ServerEntity(_idGenerator.reserve());
        sendAll(new EntityAddedPacket(
                    entity->getID(),
                    entity->getAppearance()));
        connection->sendPacket(new EntityAddedPacket(
                 entity->getID(),
                 entity->getAppearance()));
                 
        // @todo send all existing entities to the new connection

        // set connection-specific data
        ConnectionData* cd = new ConnectionData;
        cd->playerEntity = entity;
        connection->setOpaque(cd);

        // add packet handlers
        connection->definePacketHandler(this, &Game::handleSetVelocity);
    }
    
    void Game::connectionRemoved(Connection* connection) {
        ConnectionData* cd = getData(connection);
        PYR_ASSERT(cd, "connectionRemoved() called before connectionAdded()");

        sendAll(new EntityRemovedPacket(cd->playerEntity->getID()));
        connection->sendPacket(new EntityRemovedPacket(
                                   cd->playerEntity->getID()));

        _idGenerator.release(cd->playerEntity->getID());
        delete cd->playerEntity;
        delete cd;

        connection->clearHandlers();
        connection->setOpaque(0);
    }

    void Game::handleSetVelocity(Connection* c, SetVelocityPacket* p) {
        ConnectionData* cd = getData(c);
        cd->playerEntity->setVel(p->vel());
    }
    
}
