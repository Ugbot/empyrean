#include <algorithm>
#include "ByteBuffer.h"
#include "Connection.h"
#include "Packet.h"
#include "ReaderThread.h"
#include "Socket.h"
#include "Types.h"
#include "WriterThread.h"


namespace pyr {

    bool PacketReceiver::receivePacket(Connection* c, Packet* p) {
        PacketHandlerPtr handler = _handlers[typeid(*p)];
        if (handler) {
            handler->processPacket(c, p);
            return true;
        } else {
            return false;
        }
    }

    Connection::Connection(Socket* socket) {
        _tcpSocket = socket;
        _reader = new ReaderThread(socket);
        _writer = new WriterThread(socket);
        _readerThread = new Thread(_reader, PR_PRIORITY_HIGH);
        _writerThread = new Thread(_writer, PR_PRIORITY_HIGH);

        _closing = false;
    }

    Connection::~Connection() {
    }

    void Connection::processIncomingPackets() {
        std::queue<Packet*> packets(_reader->getPackets());
        while (!packets.empty()) {
            Packet* p = packets.front();
            packets.pop();

            // The set of receivers can easily be changed by the handlers.
            // Thus, make a local copy first.
            ReceiverSet r = _receivers;
            
            bool handled = false;
            for (ReceiverSetIter i = r.begin(); i != r.end(); ++i) {
                handled |= (*i)->receivePacket(this, p);
            }
            
            if (!handled) {
                PYR_LOG() << "Unhandled packet: ";
                p->log();
            }
            
            delete p;
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
