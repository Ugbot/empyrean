#include <iostream>
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
        
        _opaque = 0;
    }
    
    Connection::~Connection() {
        for (unsigned i = 0; i < _unhandledPackets.size(); ++i) {
            delete _unhandledPackets[i];
        }
        for (HandlerMapItr i = _handlers.begin(); i != _handlers.end(); ++i) {
            delete i->second;
        }
    }
    
    void Connection::processIncomingPackets() {
        std::queue<Packet*> packets(_reader->getPackets());
        while (!packets.empty()) {
            Packet* p = packets.front();
            packets.pop();

	    std::cout << "Processing packet with id: " << p->getID() << std::endl;
            
            TypeInfo ti(typeid(*p));
            PacketHandler* handler = _handlers[ti];
            if (handler) {
                handler->processPacket(this, p);
                delete p;
            } else {
		std::cout << "Unhandled packet: id = " << p->getID() << std::endl;
                _unhandledPackets.push_back(p);
            }
        }
    }
    
    void Connection::sendPacket(Packet* p) {
        _writer->addPacket(p);
    }
    
    bool Connection::isClosed() {
        return (!_readerThread->isRunning() && !_writerThread->isRunning());
    }
    
    std::string Connection::getAddress() {
        return _tcpSocket->getAddress();
    }

}
