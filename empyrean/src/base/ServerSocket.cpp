#include <prnetdb.h>
#include "ServerSocket.h"
#include "Socket.h"


namespace pyr {

    ServerSocket::ServerSocket(int port) {
        _socket = PR_NewTCPSocket();
        if (!_socket) {
            throw std::runtime_error("PR_NewTCPSocket() failed");
        }

        PRNetAddr addr;
        PRStatus status = PR_InitializeNetAddr(PR_IpAddrAny, port, &addr);
        if (status != PR_SUCCESS) {
            throw std::runtime_error("PR_InitializeNetAddr() failed");
        }
      
        status = PR_Bind(_socket, &addr);
        if (status != PR_SUCCESS) {
            throw std::runtime_error("PR_Bind() failed");
        }

        status = PR_Listen(_socket, 16);
        if (status != PR_SUCCESS) {
            throw std::runtime_error("PR_Listen() failed");
        }
    }
    
    ServerSocket::~ServerSocket() {
        PRStatus status = PR_Close(_socket);
        if (status != PR_SUCCESS) {
            throw std::runtime_error("PR_Close() failed");
        }
    }
    
    Socket* ServerSocket::accept(float timeout) {
        PRIntervalTime interval;
        if (timeout < 0) {
            interval = PR_INTERVAL_NO_TIMEOUT;
        } else {
            interval = PR_MicrosecondsToInterval(PRUint32(timeout * 1000000));
        }
        
        PRNetAddr address; // of connecting socket
        PRFileDesc* fd = PR_Accept(_socket, &address, interval);
        return (fd ? new Socket(fd) : 0);
    }

}
