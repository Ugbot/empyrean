#include <prnetdb.h>
#include "ByteBuffer.h"
#include "CondVar.h"
#include "Packet.h"
#include "Socket.h"
#include "WriterThread.h"


namespace pyr {

    WriterThread::WriterThread(Socket* socket) {
        _socket = socket;
        _outgoingLock = new Mutex();
        _packetsAvailable = new CondVar(_outgoingLock);
    }
    
    WriterThread::~WriterThread() {
        // delete outgoing packets?
        delete _packetsAvailable;
        delete _outgoingLock;
    }

    void WriterThread::run(Thread* thread) {
        while (!thread->shouldQuit()) {
            _outgoingLock->lock();
            while (_outgoing.empty()) {
                _packetsAvailable->wait(0.5f);
                if (thread->shouldQuit()) {
                    _outgoingLock->unlock();
                    return;
                }
            }

            // write a single packet (which we'll never use again,
            // so we can delete it)
            ScopedPtr<Packet> p(_outgoing.front());
            _outgoing.pop();

            _outgoingLock->unlock();

            ByteBuffer out;
            p->serialize(out);

            u16 id = PR_htons(p->getID());
            u16 size = PR_htons(u16(out.getSize()));

            int out_size = static_cast<int>(out.getSize());
            if (_socket->write(&id, sizeof(id)) != sizeof(id) ||
                _socket->write(&size, sizeof(size)) != sizeof(size) ||
                _socket->write(out.getBuffer(), out_size) != out_size)
            {
                break;
            }
            
        }
    }
    
    void WriterThread::addPacket(Packet* packet) {
        std::vector<Packet*> packets(1);
        packets[0] = packet;
        addPackets(packets);
    }
    
    void WriterThread::addPackets(const std::vector<Packet*>& packets) {
        _outgoingLock->lock();
        
        for (unsigned i = 0; i < packets.size(); ++i) {
            _outgoing.push(packets[i]);
        }
        
        _packetsAvailable->notify();
        _outgoingLock->unlock();
    }

}
