#ifndef PYR_CONNECTION_H
#define PYR_CONNECTION_H


#include <set>
#include <map>
#include "LokiTypeInfo.h"
#include "Packet.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "Thread.h"
#include "Utility.h"


namespace pyr {

    class ByteBuffer;
    class Connection;
    class ReaderThread;
    class Socket;
    class WriterThread;


    /// Base class for extra data that can be attached to a connection.
    class ConnectionData {
    public:
        virtual ~ConnectionData() { }
    };


    /**
     * PacketHandlers can be attached to a connection and are called from
     * Connection::processIncomingPackets when a packet matches the type this
     * handler can process.  At the moment, this is only used through
     * MethodPacketHandler.
     */
    class PacketHandler : public RefCounted {
    protected:
        virtual ~PacketHandler() { }

    public:
        virtual void processPacket(Connection* c, Packet* p) = 0;
    };
    typedef RefPtr<PacketHandler> PacketHandlerPtr;


    /**
     * A specialized type of PacketHandler that calls a method on an object.
     * Used by Connection::definePacketHandler.
     */
    template<typename PacketT, typename ClassT>
    class MethodPacketHandler : public PacketHandler {
    protected:
        virtual ~MethodPacketHandler() { }

    public:
        typedef void (ClassT::*MethodPointer)(Connection*, PacketT*);

        MethodPacketHandler(ClassT* handler, MethodPointer method) {
            _handler = handler;
            _method  = method;
        }

        void processPacket(Connection* c, Packet* p) {
            (_handler->*_method)(c, checked_cast<PacketT*>(p));
        }

    private:
        ClassT* _handler;
        MethodPointer _method;
    };


    /**
     * Derive from this if you want your object to receive packets.
     * Then register yourself with a Connection.
     */
    class PacketReceiver {
    protected:
        /**
         * This destructor is primarily here so that we can see the real
         * handler type in the debugger.
         */
        virtual ~PacketReceiver() { }
    
    public:
        /// Returns true if the packet was handled.
        bool receivePacket(Connection* c, Packet* p);

    protected:
        /**
         * Defines a packet handler that calls a member function
         * on the specified object.
         */
        template<typename PacketT, typename ClassT>
        void definePacketHandler(
            ClassT* handler,
            void (ClassT::*method)(Connection*, PacketT*))
        {
            typedef MethodPacketHandler<PacketT, ClassT> HandlerT;
            _handlers[typeid(PacketT)] = new HandlerT(handler, method);
        }

        /// Empty the list of handlers.
        void clearHandlers();

    private:
        typedef std::map<TypeInfo, PacketHandlerPtr> HandlerMap;
        typedef HandlerMap::iterator HandlerMapItr;

        HandlerMap _handlers;
    };


    /**
     * This class represents a packet channel between two computers.
     * Packets can be sent, and incoming packets are sent to
     * PacketReceivers.
     */
    class Connection {
    public:
        Connection(Socket* socket);
        ~Connection();

        /**
         * Call handlers for all available packets in the incoming queue.
         * If a handler is not available for a packet type, put it in the
         * _unhandledPackets list.
         */
        void processIncomingPackets();

        /// Adds a packet to the outgoing queue, taking ownership of it.
        void sendPacket(PacketPtr packet);

        /// Begins disconnecting.
        void close();

        /// Returns true if the connection has been closed.
        bool isClosed();

        /// Returns the address of the connection.
        std::string getPeerAddress();

        void setData(ConnectionData* data) { _data = data;     }
        ConnectionData* getData() const    { return _data.get(); }

        void addReceiver(PacketReceiver* receiver)    { _receivers.insert(receiver); }
        void removeReceiver(PacketReceiver* receiver) { _receivers.erase(receiver);  }

    private:
        typedef std::set<PacketReceiver*> ReceiverSet;
        typedef ReceiverSet::iterator ReceiverSetIter;
        ReceiverSet _receivers;

        ScopedPtr<Socket> _tcpSocket;

        ReaderThread* _reader;
        WriterThread* _writer;
        ScopedPtr<Thread> _readerThread;
        ScopedPtr<Thread> _writerThread;

        bool _closing;  // has close() been called?

        /// Used to store user-defined, connection-specific data.
        ScopedPtr<ConnectionData> _data;
    };

}


#endif
