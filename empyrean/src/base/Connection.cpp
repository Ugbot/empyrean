#include <algorithm>
#include "ByteBuffer.h"
#include "Connection.h"
#include "Packet.h"
#include "ReaderThread.h"
#include "Socket.h"
#include "Types.h"
#include "WriterThread.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.PacketReceiver");
    }

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
        std::queue<PacketPtr> packets(_reader->getPackets());
        while (!packets.empty()) {
            PacketPtr p = packets.front();
            packets.pop();

            // The set of receivers can easily be changed by the handlers.
            // Thus, make a local copy first.
            ReceiverSet r = _receivers;
            
            PYR_LOG(_logger, INFO) << "Received: " << p->getName();

            bool handled = false;
            for (ReceiverSetIter i = r.begin(); i != r.end(); ++i) {
                handled |= (*i)->receivePacket(this, p.get());
            }

            if (!handled) {
                _unhandled.push_back(p);
            }
        }
    }

    void Connection::sendPacket(PacketPtr p) {
        _writer->addPacket(p);
    }

    void Connection::sendPackets(const std::vector<PacketPtr>& packets) {
        _writer->addPackets(packets);
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
    
    void Connection::addReceiver(PacketReceiver* receiver) {
        // See if this receiver can handle any of the unhandled packets.
        PacketQueueIter i = _unhandled.begin();
        while (i != _unhandled.end()) {
            if (receiver->receivePacket(this, i->get())) {
                PacketQueueIter next = i;
                ++next;
                _unhandled.erase(i);
                i = next;
            } else {
                ++i;
            }
        }
    
        _receivers.insert(receiver);
    }
    
    void Connection::removeReceiver(PacketReceiver* receiver) {
        _receivers.erase(receiver);
    }

}
