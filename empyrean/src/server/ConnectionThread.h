#ifndef PYR_CONNECTION_THREAD_H
#define PYR_CONNECTION_THREAD_H


#include <SDL_net.h>
#include "Thread.h"


namespace pyr {

    class ConnectionThread : public Thread {
    public:
        ConnectionThread(TCPsocket socket);
        ~ConnectionThread();
        
        void run();
        
    private:
        TCPsocket _tcpSocket;
    };

}


#endif
