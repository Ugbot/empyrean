#ifndef PYR_LISTENER_THREAD_H
#define PYR_LISTENER_THREAD_H


#include <vector>
#include "Mutex.h"
#include "Thread.h"
#include "Utility.h"


namespace pyr {

    class Connection;
    class ServerSocket;

    class ListenerThread : public Runnable {
    public:
        ListenerThread(int port);
        
        void run();
        
        /**
         * Get a list of connections, taking ownership from the listener
         * thread.
         */
        void getConnections(std::vector<Connection*>& connections);
        
    private:
        ScopedPtr<ServerSocket> _listener;
        
        Mutex _connectionsLock;
        std::vector<Connection*> _connections;
    };

}


#endif
