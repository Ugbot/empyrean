#ifndef PYR_GAME_H
#define PYR_GAME_H


#include <string>
#include <vector>
#include "ConnectionHolder.h"
#include "Map.h"
#include "ServerConnectionData.h"
#include "ServerEntity.h"
#include "Types.h"
#include "UIDGenerator.h"

namespace pyr {

    class EntityAddedPacket;
    class PlayerBehavior;
    class PlayerEventPacket;
    class TempHUDPacket;
    class PlayerAttackPacket;
    class CollisionBox;

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

    class Game : public ConnectionHolder, public PacketReceiver {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();

        const std::string& getName() const     { return _name; }
        const std::string& getPassword() const { return _password; }

        void update(float dt);

    private:
        static GameConnectionData* getData(Connection* c);

        void addEntity(ServerEntityPtr entity);
        void removeEntity(ServerEntityPtr entity);
        static EntityAddedPacket* buildEntityAddedPacket(ServerEntityPtr entity);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handlePlayerEvent(Connection* c, PlayerEventPacket* p);
        void handleHUDUpdate(Connection* c, TempHUDPacket* p);
        void handlePlayerAttack(Connection* c, PlayerAttackPacket* p);

    private:
        int getHitModifier(CollisionBox& box, const std::string& attackType, std::vector<Vec2f>& points);

        std::string _name;
        std::string _password;

        ScopedPtr<Map> _map;
        Vec2f _startPosition;

        std::vector<ServerEntityPtr> _entities;

        UIDGenerator<u16> _idGenerator;
    };

}


#endif
