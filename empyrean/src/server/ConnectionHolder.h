#ifndef PYR_CONNECTION_HOLDER_H
#define PYR_CONNECTION_HOLDER_H


#include <vector>


namespace pyr {

    class Connection;
    class Packet;
    
    /**
     * Base class that represents the owner of a set of connections.  On
     * destruction, ConnectionHolder deletes the connections that it owns.
     * giveConnection() allows connections to be passed from one connection
     * holder to another.
     */
    class ConnectionHolder {
    public:
        /// Gives an unmanaged connection to this holder.
        void addConnection(Connection* connection);

    protected:
        ConnectionHolder();
        ~ConnectionHolder();
        
        void update();
        
        void giveConnection(Connection* c, ConnectionHolder* h);
        void clearConnections();
        
        size_t getConnectionCount();
        Connection* getConnection(size_t i);
        
        void sendAll(Packet* p);
        void sendAllBut(Connection* c, Packet* p);
        
        /**
         * Called when a connection is added to the holder.  Should
         * set up packet listeners and connection-specific data.
         * Called before connection is added to connection list.
         */
        virtual void connectionAdded(Connection* connection) = 0;
        
        /**
         * Called when a connection has been removed.  Should clean up
         * connection-specific data.  Called after connection has been
         * removed from connection list.
         */
        virtual void connectionRemoved(Connection* connection) = 0;
        
    private:
        void detachConnection(size_t index);
        void removeConnection(size_t index);

        std::vector<Connection*> _connections;
    };

}


#endif
