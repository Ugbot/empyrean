#ifndef PYR_SERVER_CONNECTION_H
#define PYR_SERVER_CONNECTION_H


#include <string>
#include <gmtl/Vec.h>
#include "Connection.h"
#include "Singleton.h"
#include "Utility.h"
#include "Thread.h"


// Xlib defines this...
#ifdef Status
#undef Status
#endif


namespace pyr {

    class JoinGameResponsePacket;
    class LobbyPacket;
    class LoginResponsePacket;
    class Packet;
    class ServerConnectionThread;
    
    class ServerConnection : public PacketReceiver {
        PYR_DECLARE_SINGLETON(ServerConnection)
        
        ServerConnection();
        ~ServerConnection() {}

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
        
        bool hasJoinGameResponse() { return _hasJoinGameResponse; }
        u16 getJoinGameResponse()  { return _joinGameResponse; }

        /// valid if DISCONNECTED after beginConnecting()
        const std::string& getError();
        
        /**
         * States don't have to call this directly.  The Application
         * takes care of it in its update.
         */
        void update();
        
        bool addReceiver(PacketReceiver* receiver);
        bool removeReceiver(PacketReceiver* receiver);

        std::vector<std::string> getLobbyMessages();
        
        bool login(const std::string& user,
                   const std::string& pass,
                   bool newuser);
        bool say(const std::string& text);
        bool joinGame(const std::string& name,
                      const std::string& password,
                      bool newGame);

        bool sendEvent(const std::string& event);
        bool sendAttack(const std::string& attack);
        bool sendHUDUpdate(Packet* p) { return sendPacket(p); }

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
        void handleJoinGameResponse(Connection*, JoinGameResponsePacket* p);

        Inited<Status, DISCONNECTED> _status;
        
        // if CONNECTING...
        Zeroed<ServerConnectionThread*> _connectionMaker;
        ScopedPtr<Thread>               _connectionThread;
        std::string                     _error;
        
        // if CONNECTED
        ScopedPtr<Connection> _connection;
        Inited<bool, false> _loginFailed;

        std::vector<std::string> _lobbyMessages;
        
        Inited<bool, false> _hasJoinGameResponse;
        Zeroed<u16> _joinGameResponse;
    };

}


#endif
