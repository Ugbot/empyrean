#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <map>
#include <vector>


namespace pyr {

    class Account;
    class Connection;
    class LoginPacket;
    class SayPacket;

    /// @note This class is designed to run within one thread.
    class World {
    public:
        ~World();

        void update(float dt);
        void addConnection(Connection* connection);
        
    private:
        struct ConnectionData {
            bool loggedIn;
            Account* account;
        };

        ConnectionData* getData(Connection* c);
        
        void removeConnection(size_t index);
    
        void handleLogin(Connection* c, LoginPacket* p);
        void handleSay(Connection* c, SayPacket* p);
        
    private:
        std::vector<Connection*> _connections;
    };

}


#endif
