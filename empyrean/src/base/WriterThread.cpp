#include <prnetdb.h>
#include "ByteBuffer.h"
#include "CondVar.h"
#include "Packet.h"
#include "ScopedLock.h"
#include "Socket.h"
#include "WriterThread.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.WriterThread");
    }

    WriterThread::WriterThread(Socket* socket) {
        _socket = socket;
        _outgoingLock = new Mutex();
        _packetsAvailable = new CondVar(_outgoingLock);
    }
    
    WriterThread::~WriterThread() {
        delete _packetsAvailable;
        delete _outgoingLock;
    }

    void WriterThread::run(Thread* thread) {
        PYR_LOG_SCOPE(_logger, INFO, "WriterThread::run");
        while (!thread->shouldQuit()) {
            PacketPtr p;  // The packet we get.

            PYR_SYNCHRONIZED(_outgoingLock, {
                while (_outgoing.empty()) {
                    _packetsAvailable->wait(0.5f);
                    if (thread->shouldQuit()) {
                        return;
                    }
                }

                p = _outgoing.front();
                _outgoing.pop();

                PYR_LOG(_logger, VERBOSE) << "Pulled packet from queue:";
                p->log();
            })

            PYR_ASSERT(p, "Read a null packet out of the writer queue.");

            ByteBuffer out;
            p->serialize(out);

            u16 id = PR_htons(p->getID());
            u16 size = PR_htons(u16(out.getSize()));

            int out_size = static_cast<int>(out.getSize());
            if (_socket->write(&id, sizeof(id)) != sizeof(id) ||
                _socket->write(&size, sizeof(size)) != sizeof(size) ||
                _socket->write(out.getBuffer(), out_size) != out_size
            ) {
                break;
            }

            PYR_LOG(_logger, VERBOSE) << "Wrote packet to socket.";            
        }
    }
    
    void WriterThread::addPacket(PacketPtr packet) {
        std::vector<PacketPtr> packets(1);
        packets[0] = packet;
        addPackets(packets);
    }

    void WriterThread::addPackets(const std::vector<PacketPtr>& packets) {
        if (packets.empty()) {
            return;
        }

        PYR_LOG_SCOPE(_logger, INFO, "WriterThread::addPackets");

        PYR_SYNCHRONIZED(_outgoingLock, {
            PYR_LOG(_logger, VERBOSE) << "Queuing packets...";
            for (size_t i = 0; i < packets.size(); ++i) {
                PYR_LOG(_logger, INFO) << "Queueing packet for writing:";
                packets[i]->log();
                _outgoing.push(packets[i]);
            }
            PYR_LOG(_logger, VERBOSE) << "Notifying writer thread.";

            _packetsAvailable->notify();
        })
    }

}
