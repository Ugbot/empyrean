#include "ListenerThread.h"
#include "ServerSocket.h"


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
            
            // the connection will delete itself
            //new Connection(socket);
        }
    }

}
