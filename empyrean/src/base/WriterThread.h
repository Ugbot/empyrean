#ifndef PYR_WRITER_THREAD_H
#define PYR_WRITER_THREAD_H


#include <queue>
#include <vector>
#include "Thread.h"


namespace pyr {

    class CondVar;
    class Mutex;
    class Packet;
    class Socket;

    class WriterThread : public Runnable {
    public:
        WriterThread(Socket* socket);
        ~WriterThread();
        
        void run(Thread* thread);
        
        void addPacket(Packet* packet);
        void addPackets(const std::vector<Packet*>& packets);
        
    private:
        Socket* _socket;
        
        Mutex* _outgoingLock;
        CondVar* _packetsAvailable;
        std::queue<Packet*> _outgoing;
    };

}


#endif
