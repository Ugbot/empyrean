#ifndef PYR_SERVER_H
#define PYR_SERVER_H


#include <map>
#include <vector>
#include "ConnectionHolder.h"
#include "Database.h"


namespace pyr {

    class Game;
    class JoinGamePacket;
    class LoginPacket;
    class Packet;
    class SayPacket;
    class ServerConnectionData;

    /**
     * Represents the actual server and server-logic.  Contains a list of
     * games.
     *
     * @note This class is designed to run within one thread.
     */
    class Server : public ConnectionHolder {
    public:
        ~Server();

        void update(float dt);

    private:
        static ServerConnectionData* getData(Connection* c);

        Game* getGame(const std::string& name);

        void connectionAdded(Connection* connection);
        void connectionRemoved(Connection* connection);

        void handleLogin(Connection* c, LoginPacket* p);
        void handleSay(Connection* c, SayPacket* p);
        void handleJoinGame(Connection* c, JoinGamePacket* p);
        
        void announceLogin(Connection* c);
        void announceLogout(Connection* d);
        
    private:
        std::vector<Game*> _games;
    };

}


#endif
