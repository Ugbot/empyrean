#ifndef PYR_SERVER_CONNECTION_H
#define PYR_SERVER_CONNECTION_H


#include <string>
#include "Connection.h"
#include "Singleton.h"
#include "Utility.h"
#include "Thread.h"


// Xlib defines this...
#ifdef Status
#undef Status
#endif


namespace pyr {

    class LobbyPacket;
    class LoginResponsePacket;
    class Packet;
    class ServerConnectionThread;
    
    class ServerConnection {
        PYR_DECLARE_SINGLETON(ServerConnection)
        
        ServerConnection();
        ~ServerConnection() { }

    public:
        enum Status {
            DISCONNECTED,
            CONNECTING,
            CONNECTED,
            LOGGED_IN,
        };
    
        void beginConnecting(const std::string& server, int port);
        void disconnect();
        bool isConnected();
        Status getStatus();
        bool loginFailed();
        
        /// valid if DISCONNECTED after beginConnecting()
        const std::string& getError();
        
        void update();

        std::vector<std::string> getLobbyMessages();
        
        bool login(const std::string& user,
                   const std::string& pass,
                   bool newuser);

        bool say(const std::string& text);

        /**
         * Sends a packet to the server.
         *
         * @returns  true if connection is made and packet is sent,
         *           false otherwise
         */
        bool sendPacket(Packet* p);
    
    private:
        void handleLoginResponse(Connection*, LoginResponsePacket* p);
        void handleLobby(Connection*, LobbyPacket* p);
    
        Status _status;
        
        // if CONNECTING...
        ServerConnectionThread* _connectionMaker;
        ScopedPtr<Thread>       _connectionThread;
        std::string             _error;
        
        // if CONNECTED
        ScopedPtr<Connection> _connection;
        bool _loginFailed;

        std::vector<std::string> _lobbyMessages;
    };

}


#endif
