#include "CondVar.h"
#include "WriterThread.h"


namespace pyr {

    WriterThread::WriterThread(Socket* socket) {
        _socket = socket;
        _outgoingLock = new Mutex();
        _packetsAvailable = new CondVar(_outgoingLock);
    }
    
    WriterThread::~WriterThread() {
        delete _packetsAvailable;
        delete _outgoingLock;
    }
    
    void WriterThread::run() {
        for (;;) {
            _outgoingLock->lock();
            while (_outgoing.empty()) {
                _packetsAvailable->wait();
            }
            
            // write all packets packet
            _outgoing.pop();
            
            _packetsAvailable->notify();
            _outgoingLock->unlock();
        }
    }
    
    void WriterThread::addPacket(Packet* packet) {
        std::vector<Packet*> packets(1);
        packets[0] = packet;
        addPackets(packets);
    }
    
    void WriterThread::addPackets(const std::vector<Packet*>& packets) {
        _outgoingLock->lock();
        _packetsAvailable->wait();
        
        for (unsigned i = 0; i < packets.size(); ++i) {
            _outgoing.push(packets[i]);
        }
        
        _packetsAvailable->notify();
        _outgoingLock->unlock();
    }

}
