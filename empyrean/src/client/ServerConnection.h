#ifndef PYR_SERVER_CONNECTION_H
#define PYR_SERVER_CONNECTION_H


#include <string>
#include "Utility.h"


namespace pyr {

    class Connection;
    class EntityAddedPacket;
    class EntityRemovedPacket;
    class LoginResponsePacket;
    class Scene;
    class UpdatePacket;
    
    class ServerConnection {
    public:
        static ServerConnection& instance();
        
    private:
        static void destroy();
        
        ServerConnection();
        
    public:
        void connect(const std::string& server, int port, Scene* scene);
        void disconnect();
        bool isConnected();
        
        void update();
        
        void login(const std::string& user, const std::string& pass);
        bool isLoggedIn() {
            return _loggedIn;
        }
    
    private:
        void handleLoginResponse(Connection*, LoginResponsePacket* p);
        void handleEntityAdded(Connection* c, EntityAddedPacket* p);
        void handleEntityRemoved(Connection* c, EntityRemovedPacket* p);
        void handleUpdate(Connection* c, UpdatePacket* p);
    
        static ServerConnection* _instance;
            
        ScopedPtr<Connection> _connection;
        Scene* _scene;
        
        bool _loggedIn;
        int _entityID;
    };

}


#endif
