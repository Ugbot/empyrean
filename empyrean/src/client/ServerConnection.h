#ifndef PYR_SERVER_CONNECTION_H
#define PYR_SERVER_CONNECTION_H


#include <string>
#include "Utility.h"


namespace pyr {

    class Connection;
    class UpdatePacket;

    class ServerConnection {
    public:
        static ServerConnection& instance();
        
    private:
        static void destroy();
        
    public:
        void connectToServer(const std::string& server);
        bool isConnected();
    
    private:
        void handleUpdate(Connection* c, UpdatePacket* p);
    
        static ServerConnection* _instance;
            
        ScopedPtr<Connection> _connection;
    };

}


#endif
