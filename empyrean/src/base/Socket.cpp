#include <prerror.h>
#include <prnetdb.h>
#include "Socket.h"


namespace pyr {

    Socket::Socket(PRFileDesc* fd) {
        _socket = fd;
    }
    
    Socket::Socket(const std::string& host, int port) {
        _socket = PR_NewTCPSocket();
        if (!_socket) {
            throw std::runtime_error("PR_NewTCPSocket() failed");
        }
        
        PRNetAddr addr;
        memset(&addr, 0, sizeof(addr));
        
        PRStatus status = PR_StringToNetAddr(host.c_str(), &addr);
        if (status != PR_SUCCESS) {
            PR_Close(_socket);
            _socket = 0;
            throw std::runtime_error("PR_StringToNetAddr() failed");
        }
        
        addr.inet.family = PR_AF_INET;
        addr.inet.port   = PR_htons(port);
        
        status = PR_Connect(_socket, &addr, PR_INTERVAL_NO_TIMEOUT);
        if (status != PR_SUCCESS) {
            PR_Close(_socket);
            _socket = 0;
            throw std::runtime_error("PR_Connect() failed");
        }
    }
    
    Socket::~Socket() {
        if (_socket) {
            PRStatus status = PR_Close(_socket);
            _socket = 0;
            if (status != PR_SUCCESS) {
                throw std::runtime_error("PR_Close() failed");
            }
        }
    }
    
    int Socket::read(void* buffer, int size) {
        int read = PR_Recv(_socket, buffer, size, 0, PR_INTERVAL_NO_TIMEOUT);
        // if the peer closed the connection or we were interrupted
        if (read < 0 && PR_GetError() == PR_PENDING_INTERRUPT_ERROR) {
            throw std::runtime_error("Interrupt occurred");
        } else if (read < 0) {
            throw std::runtime_error("Unknown error");
        }
        return read;
    }
    
    int Socket::write(const void* buffer, int size) {
        int sent = PR_Send(_socket, buffer, size, 0, PR_INTERVAL_NO_TIMEOUT);
        // if we were interrupted
        if (sent < 0 && PR_GetError() == PR_PENDING_INTERRUPT_ERROR) {
            throw std::runtime_error("Interrupt occurred");
        } else if (sent < 0) {
            throw std::runtime_error("Unknown error");
        }
        return sent;
    }

}
