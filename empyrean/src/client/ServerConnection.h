#ifndef PYR_SERVER_CONNECTION_H
#define PYR_SERVER_CONNECTION_H


#include <string>
#include "Utility.h"


namespace pyr {

    class Connection;
    class EntityAddedPacket;
    class EntityRemovedPacket;
    class LoginResponsePacket;
    class Packet;
    class UpdatePacket;
    
    class ServerConnection {
    public:
        static ServerConnection& instance();
        
    private:
        static void destroy();
        
        ServerConnection();
        
    public:
        void connect(const std::string& server, int port);
        void disconnect();
        bool isConnected();
        
        void update();
        
        bool login(const std::string& user, const std::string& pass);
        bool isLoggedIn() {
            return _loggedIn;
        }

	void setForce(float force);

	/**
	 * Sends a packet to the server.
	 *
	 * @returns  true if connection is made and packet is sent,
         *           false otherwise
	 */
	bool sendPacket(Packet* p);
    
    private:
        void handleLoginResponse(Connection*, LoginResponsePacket* p);
        void handleEntityAdded(Connection* c, EntityAddedPacket* p);
        void handleEntityRemoved(Connection* c, EntityRemovedPacket* p);
        void handleUpdate(Connection* c, UpdatePacket* p);
    
        static ServerConnection* _instance;
            
        ScopedPtr<Connection> _connection;
        
        bool _loggedIn;
        int _entityID;

	float _force;
    };

}


#endif
