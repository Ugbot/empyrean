#include "ByteBuffer.h"
#include "ReaderThread.h"
#include "ScopedLock.h"
#include "Socket.h"


namespace pyr {

    ReaderThread::ReaderThread(Socket* socket) {
        _socket = socket;
    }
    
    void ReaderThread::run() {
        ByteBuffer bb;

        while (!shouldQuit()) {
            u8 buffer[1024];
            int read = _socket->read(buffer, sizeof(buffer));
            if (read == 0) {
                break;
            }
            
            bb.add(buffer, read);
            
            while (Packet* p = extractPacket(bb)) {
                ScopedLock lock(&_incomingLock);
                _incoming.push(p);
            }
        }
    }
    
    std::queue<Packet*> ReaderThread::getPackets() {
        ScopedLock lock(&_incomingLock);
        std::queue<Packet*> packets = _incoming;
        while (!_incoming.empty()) {
            _incoming.pop();
        }
        return packets;
    }
    
    Packet* ReaderThread::extractPacket(ByteBuffer& bb) {
        return 0;
    }

}
