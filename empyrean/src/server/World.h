#ifndef PYR_WORLD_H
#define PYR_WORLD_H


#include <map>
#include <vector>
#include "ConnectionHolder.h"


namespace pyr {

    class Account;
    class Game;
    class JoinGamePacket;
    class LoginPacket;
    class NewCharacterPacket;
    class Packet;
    class SayPacket;

    /**
     * Represents the actual server and server-logic.
     *
     * @note This class is designed to run within one thread.
     */
    class World : public ConnectionHolder {
    public:
        ~World();

        void update(float dt);
        
    private:
        struct ConnectionData {
            bool loggedIn;
            Account* account;
        };

        static ConnectionData* getData(Connection* c);
        
        Game* getGame(const std::string& name);
        
        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);
    
        void handleLogin(Connection* c, LoginPacket* p);
        void handleSay(Connection* c, SayPacket* p);
        void handleJoinGame(Connection* c, JoinGamePacket* p);
        void handleNewCharacter(Connection* c, NewCharacterPacket* p);
        
        void announceLogin(Connection* c);
        void announceLogout(Connection* d);
        
    private:
        std::vector<Game*> _games;
    };

}


#endif
