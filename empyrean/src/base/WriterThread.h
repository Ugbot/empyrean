#ifndef PYR_WRITER_THREAD_H
#define PYR_WRITER_THREAD_H


#include <queue>
#include <vector>
#include "Packet.h"
#include "Thread.h"
#include "UnownedPtr.h"


namespace pyr {

    class CondVar;
    class Mutex;
    class Socket;

    class WriterThread : public Runnable {
    public:
        WriterThread(Socket* socket);
        ~WriterThread();
        
        void run(Thread* thread);
        
        void addPacket(PacketPtr packet);
        void addPackets(const std::vector<PacketPtr>& packets);
        
    private:
        UnownedPtr<Socket> _socket;
        
        // Not ScopedPtr because we need to be in control of when they
        // are destroyed.
        Mutex* _outgoingLock;
        CondVar* _packetsAvailable;
        std::queue<PacketPtr> _outgoing;
    };

}


#endif
