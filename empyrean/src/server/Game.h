#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>
#include "ConnectionHolder.h"
#include "Types.h"
#include "UIDGenerator.h"
#include "Map.h"

namespace pyr {

    class PlayerEventPacket;
    class ServerEntity;

    class Game : public ConnectionHolder {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();

        const std::string& getName() const     { return _name; }
        const std::string& getPassword() const { return _password; }

        void update(float dt);

    private:
        struct ConnectionData {
            ServerEntity* playerEntity;
        };

        static ConnectionData* getData(Connection* c);

        void addEntity(ServerEntity* entity);
        void removeEntity(ServerEntity* entity);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handlePlayerEvent(Connection* c, PlayerEventPacket* p);

    private:
        std::string _name;
        std::string _password;

        ScopedPtr<Map> _map;
        Vec2f _startPosition;

        std::vector<ServerEntity*> _entities;

        UIDGenerator<u16> _idGenerator;
    };

}


#endif
