#include <prerror.h>
#include <prnetdb.h>
#include "NSPRUtility.h"
#include "Socket.h"
#include "Types.h"


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
    
    /**
     * @returns  0 if eof or error, -1 if timed out, and number of bytes
     *           read otherwise
     */
    int Socket::read(void* buffer, int size, float timeout) {
        int result = PR_Recv(_socket, buffer, size, 0, secondsToInterval(timeout));
        PRErrorCode error = PR_GetError();
        
        if (result == 0) {
            return -1;
        } else if (result == -1) {
            if (error == PR_IO_TIMEOUT_ERROR) {
	        return 0;
	    } else {
	        return -1;
	    }
	} else {
	    return result;
	}
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
    
    std::string Socket::getHostAddress() {
        PRNetAddr addr;
        if (PR_GetSockName(_socket, &addr) == PR_SUCCESS) {
            char str[80];
            u8* ip = (u8*)&addr.inet.ip;
            sprintf(str, "%d.%d.%d.%d", ip[0], ip[1], ip[2], ip[3]);
            return str;
        } else {
            return "";
        }
    }
    
    std::string Socket::getPeerAddress() {
        PRNetAddr addr;
        if (PR_GetPeerName(_socket, &addr) == PR_SUCCESS) {
            char str[80];
            u8* ip = (u8*)&addr.inet.ip;
            sprintf(str, "%d.%d.%d.%d", ip[0], ip[1], ip[2], ip[3]);
            return str;
        } else {
            return "";
        }
    }

}
