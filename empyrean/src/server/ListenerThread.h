#ifndef PYR_LISTENER_THREAD_H
#define PYR_LISTENER_THREAD_H


#include "Thread.h"
#include "Utility.h"


namespace pyr {

    class ServerSocket;

    class ListenerThread : public Runnable {
    public:
        ListenerThread(int port);
        
        void run();
        
    private:
        ScopedPtr<ServerSocket> _listener;
    };

}


#endif
