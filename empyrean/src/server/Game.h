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

    class AllowUpdatesPacket;
    class EntityAddedPacket;
    class PlayerBehavior;
    class PlayerEventPacket;
    class TempHUDPacket;
    class PlayerAttackPacket;

    class CollisionBox;
    class GameConnectionData;
    class WorldAspect;

    class Game : public ConnectionHolder {
    public:
        Game(const std::string& name, const std::string& password);
        ~Game();

        const std::string& getName() const     { return _name; }
        const std::string& getPassword() const { return _password; }

        void update(float dt);

    private:
        static GameConnectionData* getData(Connection* c);

        void loadGameResources();
        void updateWorld(float dt);
        void updateConnections();
        void updateConnection(const WorldAspect& aspect, Connection* c);
        
        void addEntity(ServerEntityPtr entity);
        void removeEntity(ServerEntityPtr entity);
        static EntityAddedPacket* buildEntityAddedPacket(ServerEntityPtr entity);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handleAllowUpdates(Connection* c, AllowUpdatesPacket* p);
        void handlePlayerEvent(Connection* c, PlayerEventPacket* p);
        void handleHUDUpdate(Connection* c, TempHUDPacket* p);
        void handlePlayerAttack(Connection* c, PlayerAttackPacket* p);

        int getHitModifier(CollisionBox& box, const string& attackType,
                           std::vector<Vec2f>& points);

		void handleMonsterAttack(ServerEntityPtr attacker);

    private:
        string _name;
        string _password;

        MapPtr _map;
        Vec2f _startPosition;

        std::vector<ServerEntityPtr> _entities;

        UIDGenerator<u16> _idGenerator;
    };

}


#endif
