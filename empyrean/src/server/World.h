#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <map>
#include <vector>


namespace pyr {

    class Account;
    class Connection;
    class Game;
    class JoinGamePacket;
    class LoginPacket;
    class Packet;
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
        
        void sendAll(Packet* p);
        void sendAllBut(Connection* c, Packet* p);
        
        Game* getGame(const std::string& name);
    
        void handleLogin(Connection* c, LoginPacket* p);
        void handleSay(Connection* c, SayPacket* p);
        void handleJoinGame(Connection* c, JoinGamePacket* p);
        
        void announceLogin(Connection* c);
        void announceLogout(Connection* d);
        
    private:
        std::vector<Connection*> _connections;
        std::vector<Game*> _games;
    };

}


#endif
