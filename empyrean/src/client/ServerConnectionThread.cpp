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
            
            ScopedLock lock(_mutex);
            _socket = socket;
            _status = CONNECT_SUCCEEDED;
        }
        catch (const std::exception& e) {
            ScopedLock lock(_mutex);
            _status = CONNECT_FAILED;
            _error = e.what();
        }
    }
    
    ServerConnectionThread::Status ServerConnectionThread::getStatus() {
        ScopedLock lock(_mutex);
        return _status;
    }
    
    Socket* ServerConnectionThread::getSocket() {
        ScopedLock lock(_mutex);
        return _socket;
    }
    
    const std::string& ServerConnectionThread::getError() {
        ScopedLock lock(_mutex);
        return _error;
    }

}
