#ifndef PYR_SOCKET_H
#define PYR_SOCKET_H


#include <string>
#include <prio.h>


namespace pyr {

    class Socket {
    public:
        Socket(PRFileDesc* fd);
        Socket(const std::string& host, int port);
        ~Socket();
        
        /// if this returns 0, the socket has been disconnected
        int read(void* buffer, int size);
        
        /// if this returns 0, the socket has been disconnected
        int write(const void* buffer, int size);
        
    private:
        PRFileDesc* _socket;
    };

}


#endif