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
            int read = _socket->read(buffer, sizeof(buffer), 0.5f);
            if (read < 0) {
                break;
            }
            
            bb.add(buffer, read);

            while (Packet* p = extractPacket(bb)) {
                ScopedLock lock(_incomingLock);
                _incoming.push(p);
            }
        }
    }
    
    std::queue<Packet*> ReaderThread::getPackets() {
        ScopedLock lock(_incomingLock);
        std::queue<Packet*> packets = _incoming;
        while (!_incoming.empty()) {
            _incoming.pop();
        }
        return packets;
    }
    
    Packet* ReaderThread::extractPacket(ByteBuffer& bb) {
        if (bb.getSize() > 4) {
            u16* p_id   = (u16*)bb.getBuffer();
            u16* p_size = (u16*)bb.getBuffer() + 1;
            u16 id   = PR_ntohs(*p_id);
            u16 size = PR_ntohs(*p_size);
            
            if (bb.getSize() >= 4 + size) {
                Packet* p = _factory.create(id, size, (u8*)bb.getBuffer() + 4);
                bb.consumeFront(4 + size);
                return p;
            }
        }
        return 0;
    }

}
