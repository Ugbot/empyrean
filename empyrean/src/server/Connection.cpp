#include <iostream>
#include "ByteBuffer.h"
#include "Connection.h"
#include "ReaderThread.h"
#include "Socket.h"
#include "Types.h"
#include "WriterThread.h"


namespace pyr {

    Connection::Connection(Socket* socket) {
        _tcpSocket = socket;
        _reader = new ReaderThread(socket);
        _writer = new WriterThread(socket);
    }
    
    Connection::~Connection() {
    }

}
