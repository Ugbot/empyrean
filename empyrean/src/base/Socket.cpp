#include <prerror.h>
#include <prnetdb.h>
#include "Socket.h"
#include "NSPRUtility.h"


namespace pyr {

    Socket::Socket(PRFileDesc* fd) {
        _socket = fd;
    }
    
    Socket::Socket(const std::string& host, int port) {
        char buffer[PR_NETDB_BUF_SIZE];
        PRHostEnt hostentry;
        PRStatus status = PR_GetHostByName(
            host.c_str(), buffer, sizeof(buffer), &hostentry);
        if (status != PR_SUCCESS) {
            throwNSPRError("PR_GetHostByName() failed");
        }
        
        PRNetAddr addr;
        int result = PR_EnumerateHostEnt(0, &hostentry, port, &addr);
        if (result == -1) {
            throwNSPRError("PR_EnumerateHostEnt() failed");
        }
        
        _socket = PR_NewTCPSocket();
        if (!_socket) {
            throwNSPRError("PR_NewTCPSocket() failed");
        }
        
        status = PR_Connect(_socket, &addr, PR_INTERVAL_NO_TIMEOUT);
        if (status != PR_SUCCESS) {
            PR_Close(_socket);
            _socket = 0;
            throwNSPRError("PR_Connect() failed");
        }
    }
    
    Socket::~Socket() {
        if (_socket) {
            PRStatus status = PR_Close(_socket);
            _socket = 0;
            if (status != PR_SUCCESS) {
                throwNSPRError("PR_Close() failed");
            }
        }
    }
    
    int Socket::read(void* buffer, int size) {
        int read = PR_Recv(_socket, buffer, size, 0, PR_INTERVAL_NO_TIMEOUT);
        // if the peer closed the connection or we were interrupted
        if (read < 0 && PR_GetError() == PR_PENDING_INTERRUPT_ERROR) {
            return 0;
            //throwNSPRError("Interrupt occurred");
        } else if (read < 0) {
            return 0;
            //throwNSPRError("PR_Recv: Unknown error");
        }
        return read;
    }
    
    int Socket::write(const void* buffer, int size) {
        int sent = PR_Send(_socket, buffer, size, 0, PR_INTERVAL_NO_TIMEOUT);
        // if we were interrupted
        if (sent < 0 && PR_GetError() == PR_PENDING_INTERRUPT_ERROR) {
            return 0;
            //throwNSPRError("Interrupt occurred");
        } else if (sent < 0) {
            return 0;
            //throwNSPRError("Unknown error");
        }
        return sent;
    }

}
