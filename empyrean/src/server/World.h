#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <map>
#include <vector>
#include "UIDGenerator.h"
#include "Types.h"


namespace pyr {

    class Connection;
    class LoginPacket;
    class PlayerStatePacket;
    class ServerEntity;

    /// @note This class is designed to run within one thread.
    class World {
    public:
        ~World();
    
        void update(float dt);
        void addConnection(Connection* connection);
        
    private:
        struct ConnectionData {
            bool loggedIn;
            u16 entityID;
        };
        
        void removeConnection(unsigned index);
    
        void handleLogin(Connection* c, LoginPacket* p);
	void handlePlayerState(Connection* c, PlayerStatePacket* p);
        
        void addEntity(u16 id, ServerEntity* entity);
        void removeEntity(u16 id);
	ServerEntity* getEntity(u16 id);
        
    private:
        std::vector<Connection*> _connections;
        
        UIDGenerator<u16> _uidGenerator;
        
        typedef std::map<u16, ServerEntity*> EntityMap;
        EntityMap _entities;
    };

}


#endif
