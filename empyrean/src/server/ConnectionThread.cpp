#include "ConnectionThread.h"


namespace pyr {

    ConnectionThread::ConnectionThread(TCPsocket socket) {
        _tcpSocket = socket;
    }
    
    ConnectionThread::~ConnectionThread() {
    }
    
    void ConnectionThread::run() {
        
    }

}
