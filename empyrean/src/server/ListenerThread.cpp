#include "Connection.h"
#include "ListenerThread.h"
#include "ScopedLock.h"
#include "ServerSocket.h"


namespace pyr {

    ListenerThread::ListenerThread(int port)  {
        _listener = new ServerSocket(port);
    }

    void ListenerThread::run(Thread* thread) {
        while (!thread->shouldQuit()) {
            Socket* socket = _listener->accept(0.5f);
            if (socket) {
                ScopedLock lock(_connectionsLock);
                _connections.push_back(new Connection(socket));
            }
        }
    }
    
    void ListenerThread::getConnections(std::vector<Connection*>& connections) {
        ScopedLock lock(_connectionsLock);
        connections = _connections;
        _connections.clear();
    }

}
