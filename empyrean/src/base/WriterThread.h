#ifndef PYR_WRITER_THREAD_H
#define PYR_WRITER_THREAD_H


#include <queue>
#include <vector>
#include "CondVar.h"
#include "Packet.h"
#include "Thread.h"
#include "UnownedPtr.h"


namespace pyr {

    class Socket;

    class WriterThread : public Runnable {
    public:
        WriterThread(Socket* socket);
        ~WriterThread() { }
        
        void run(Thread* thread);
        
        void addPacket(Packet* packet);
        void addPackets(const std::vector<Packet*>& packets);
        
    private:
        UnownedPtr<Socket> _socket;
        
        CondVar _packetsAvailable;
        std::queue<PacketPtr> _outgoing;
    };

}


#endif
