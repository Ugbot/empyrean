#include "ByteBuffer.h"
#include "Connection.h"
#include "Packet.h"
#include "ReaderThread.h"
#include "Socket.h"
#include "Types.h"
#include "WriterThread.h"


namespace pyr {

    Connection::Connection(Socket* socket) {
        _tcpSocket = socket;
        _reader = new ReaderThread(socket);
        _writer = new WriterThread(socket);
        _readerThread = new Thread(_reader, PR_PRIORITY_HIGH);
        _writerThread = new Thread(_writer, PR_PRIORITY_HIGH);
        
        _closing = false;
        
        _opaque = 0;
    }
    
    Connection::~Connection() {
        for_each(_unhandledPackets.begin(), _unhandledPackets.end(),
                 delete_function<Packet>);
    }
    
    void Connection::clearHandlers() {
        _handlers.clear();
    }
    
    void Connection::processIncomingPackets() {
        std::queue<Packet*> packets(_reader->getPackets());
        while (!packets.empty()) {
            Packet* p = packets.front();
            packets.pop();

            TypeInfo ti(typeid(*p));
            PacketHandlerPtr handler = _handlers[ti];
            if (handler) {
                handler->processPacket(this, p);
                delete p;
            } else {
                _unhandledPackets.push_back(p);
            }
        }
    }
    
    void Connection::sendPacket(Packet* p) {
        _writer->addPacket(p);
    }
    
    void Connection::close() {
        _closing = true;
    }
    
    bool Connection::isClosed() {
        return _closing || (!_readerThread->isRunning() || !_writerThread->isRunning());
    }
    
    std::string Connection::getPeerAddress() {
        return _tcpSocket->getPeerAddress();
    }

}
