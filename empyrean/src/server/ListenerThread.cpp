#include "Connection.h"
#include "ListenerThread.h"
#include "ServerSocket.h"
#include "World.h"


namespace pyr {

    ListenerThread::ListenerThread(int port)  {
        _listener = new ServerSocket(port);
    }
    
    void ListenerThread::run() {
        while (!shouldQuit()) {
            Socket* socket = _listener->accept();
            if (!socket) {
                break;
            }
            
            World::instance().addConnection(new Connection(socket));
        }
    }

}
