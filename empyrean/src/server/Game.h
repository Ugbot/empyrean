#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>
#include "ConnectionHolder.h"
#include "Map.h"
#include "ServerConnectionData.h"
#include "Types.h"
#include "UIDGenerator.h"

namespace pyr {

    class EntityAddedPacket;
    class PlayerBehavior;
    class PlayerEventPacket;
    class TempHUDPacket;
    class ServerEntity;

    /// While in a game, extra data is needed.
    struct GameConnectionData : public ServerConnectionData {
        GameConnectionData() {
            playerEntity = 0;
            behavior = 0;
        }

        GameConnectionData(const ServerConnectionData& rhs)
            : ServerConnectionData(rhs)
        {
            playerEntity = 0;
            behavior = 0;
        }

        GameConnectionData(const GameConnectionData& rhs)
            : ServerConnectionData(rhs)
        {
            playerEntity = rhs.playerEntity;
            behavior = rhs.behavior;
        }

        // Can't use Zeroed<> because delete doesn't work.
        ServerEntity* playerEntity;
        PlayerBehavior* behavior;
    };

    class Game : public ConnectionHolder {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();

        const std::string& getName() const     { return _name; }
        const std::string& getPassword() const { return _password; }

        void update(float dt);

    private:
        static GameConnectionData* getData(Connection* c);

        void addEntity(ServerEntity* entity);
        void removeEntity(ServerEntity* entity);
        static EntityAddedPacket* buildEntityAddedPacket(ServerEntity* entity);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handlePlayerEvent(Connection* c, PlayerEventPacket* p);
        void handleHUDUpdate(Connection* c, TempHUDPacket* p);

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
