#ifndef PYR_CONNECTION_H
#define PYR_CONNECTION_H


#include <queue>
#include "Thread.h"
#include "Utility.h"


namespace pyr {

    class ByteBuffer;
    class Packet;
    class ReaderThread;
    class Socket;
    class WriterThread;

    class Connection {
    public:
        Connection(Socket* socket);
        ~Connection();
        
        bool isClosed();
        
    private:
        ScopedPtr<Socket> _tcpSocket;
        
        ScopedPtr<ReaderThread> _reader;
        ScopedPtr<WriterThread> _writer;
    };

}


#endif
