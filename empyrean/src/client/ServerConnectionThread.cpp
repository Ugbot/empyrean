#include "ScopedLock.h"
#include "ServerConnectionThread.h"
#include "Socket.h"


namespace pyr {

    ServerConnectionThread::ServerConnectionThread(const std::string& server, int port) {
        _server = server;
        _port   = port;
        _status = NOT_CONNECTED;
        _socket = 0;
    }
    
    void ServerConnectionThread::run(Thread* /*thread*/) {
        try {
            Socket* socket = new Socket(_server, _port);
            
            PYR_SYNCHRONIZED(_mutex, {
                _socket = socket;
                _status = CONNECT_SUCCEEDED;
            })
        }
        catch (const std::exception& e) {
            PYR_SYNCHRONIZED(_mutex, {
                _status = CONNECT_FAILED;
                _error = e.what();
            })
        }
    }
    
    ServerConnectionThread::Status ServerConnectionThread::getStatus() {
        PYR_SYNCHRONIZED(_mutex, {
            return _status;
        })
    }
    
    Socket* ServerConnectionThread::getSocket() {
        PYR_SYNCHRONIZED(_mutex, {
            return _socket;
        })
    }
    
    const std::string& ServerConnectionThread::getError() {
        PYR_SYNCHRONIZED(_mutex, {
            return _error;
        })
    }

}
