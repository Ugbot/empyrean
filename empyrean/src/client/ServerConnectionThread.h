#ifndef PYR_SERVER_CONNECTION_THREAD_H
#define PYR_SERVER_CONNECTION_THREAD_H


#include "Mutex.h"
#include "Thread.h"


namespace pyr {

    class Socket;

    class ServerConnectionThread : public Runnable {
    public:
        enum Status {
            NOT_CONNECTED,
            CONNECT_SUCCEEDED,
            CONNECT_FAILED,
        };
    
        ServerConnectionThread(const std::string& server, int port);

        void run();
        
        Status getStatus();
        Socket* getSocket();           // valid if status == CONNECT_SUCCEEDED
        const std::string& getError(); // valid if status == CONNECT_FAILED
        
    private:
        std::string _server;
        int _port;
        
        Mutex _mutex;

        Status _status;
        Socket* _socket;
        std::string _error;
    };

}


#endif
