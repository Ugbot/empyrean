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

    class EntityAddedPacket;
    class EntityRemovedPacket;
    class EntityUpdatedPacket;
    class JoinGameResponsePacket;
    class LobbyPacket;
    class LoginResponsePacket;
    class NewCharacterResponsePacket;
    class Packet;
    class ServerConnectionThread;
    class SetPlayerPacket;
    
    class ServerConnection {
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
        
        bool hasNewCharacterResponse() { return _hasNewCharacterResponse; }
        u16 getNewCharacterResponse()  { return _newCharacterResponse; }
        
        /// valid if DISCONNECTED after beginConnecting()
        const std::string& getError();
        
        void update();

        std::vector<std::string> getLobbyMessages();
        
        bool login(const std::string& user,
                   const std::string& pass,
                   bool newuser);

        bool say(const std::string& text);
        
        bool joinGame(const std::string& name,
                      const std::string& password,
                      bool newGame);
                      
        bool newCharacter(const std::string& name);

        bool setVelocity(const gmtl::Vec2f& vel);

    private:
        /**
         * Sends a packet to the server.
         *
         * @returns  true if connection is made and packet is sent,
         *           false otherwise
         */
        bool sendPacket(Packet* p);
    
        void handleLoginResponse(Connection*, LoginResponsePacket* p);
        void handleLobby(Connection*, LobbyPacket* p);
        void handleJoinGameResponse(Connection*, JoinGameResponsePacket* p);
        void handleNewCharacterResponse(Connection*, NewCharacterResponsePacket* p);
        void handleSetPlayer(Connection*, SetPlayerPacket* p);

        void handleEntityAdded(Connection*, EntityAddedPacket* p);
        void handleEntityRemoved(Connection*, EntityRemovedPacket* p);
        void handleEntityUpdated(Connection*, EntityUpdatedPacket* p);
    
        Status _status;
        
        // if CONNECTING...
        ServerConnectionThread* _connectionMaker;
        ScopedPtr<Thread>       _connectionThread;
        std::string             _error;
        
        // if CONNECTED
        ScopedPtr<Connection> _connection;
        bool _loginFailed;

        std::vector<std::string> _lobbyMessages;
        
        bool _hasJoinGameResponse;
        u16 _joinGameResponse;
        
        bool _hasNewCharacterResponse;
        u16 _newCharacterResponse;
    };

}


#endif
