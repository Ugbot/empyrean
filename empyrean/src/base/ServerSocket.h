#ifndef PYR_SERVER_SOCKET_H
#define PYR_SERVER_SOCKET_H


#include <prio.h>


namespace pyr {

    class Socket;

    class ServerSocket {
    public:
        ServerSocket(int port);        
        ~ServerSocket();
        
        /**
         * Accepts a connection on the port.
         *
         * @param timeout  The number of seconds to wait for a connection.
         *                 If negative, wait indefinitely.
         */
        Socket* accept(float timeout = -1);
        
    private:
        PRFileDesc* _socket;
    };

}


#endif
