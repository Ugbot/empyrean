#ifndef PYR_READER_THREAD_H
#define PYR_READER_THREAD_H


#include <queue>
#include "Mutex.h"
#include "PacketFactory.h"
#include "Thread.h"


namespace pyr {

    class ByteBuffer;
    class Packet;
    class Socket;

    class ReaderThread : public Thread {
    public:
        ReaderThread(Socket* socket);
        
        void run();
        
        std::queue<Packet*> getPackets();
        
    private:
        Packet* extractPacket(ByteBuffer& bb);
    
        Socket* _socket;
        
        Mutex _incomingLock;
        std::queue<Packet*> _incoming;
        
        PacketFactory _factory;
    };

}


#endif
