#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <vector>
#include "Mutex.h"


namespace pyr {

    class Connection;
    class LoginPacket;

    class World {
    public:
        static World& instance();
        
    private:
        static void destroy();
        
    public:
        ~World();
    
        void update(float dt);
        void addConnection(Connection* connection);
        
    private:
        void handleLogin(Connection* c, LoginPacket* p);
    
        static World* _instance;
    
        std::vector<Connection*> _connections;
        Mutex _connectionsLock;
    };

}


#endif
