#include "ByteBuffer.h"
#include "Log.h"
#include "Packet.h"
#include "ReaderThread.h"
#include "ScopedLock.h"
#include "Socket.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.ReaderThread");
    }

    ReaderThread::ReaderThread(Socket* socket) {
        _socket = socket;
    }

    void ReaderThread::run(Thread* thread) {
        ByteBuffer bb;

        while (!thread->shouldQuit()) {
            u8 buffer[1024];
            int read = _socket->read(buffer, sizeof(buffer), 0.5f);
            if (read < 0) {
                break;
            }

            bb.add(buffer, read);

            while (Packet* p = extractPacket(bb)) {
                PYR_LOG(_logger, INFO) << "Read packet:" << p->getName();
                p->log();
                PYR_SYNCHRONIZED(_incomingLock, {
                    _incoming.push(p);
                })
            }
        }
    }

    std::queue<PacketPtr> ReaderThread::getPackets() {
        PYR_SYNCHRONIZED(_incomingLock, {
            std::queue<PacketPtr> packets = _incoming;
            while (!_incoming.empty()) {
                _incoming.pop();
            }
            return packets;
        })
    }

    Packet* ReaderThread::extractPacket(ByteBuffer& bb) {
        if (bb.getSize() > 4) {
            u16* p_id   = (u16*)bb.getBuffer();
            u16* p_size = (u16*)bb.getBuffer() + 1;
            u16 id   = PR_ntohs(*p_id);
            u16 size = PR_ntohs(*p_size);

            if (bb.getSize() >= size_t(4 + size)) {
                Packet* p = _factory.create(id, size, (u8*)bb.getBuffer() + 4);
                bb.consumeFront(4 + size);
                return p;
            }
        }
        return 0;
    }

}
