#ifndef PYR_CONNECTION_H
#define PYR_CONNECTION_H


#include <map>
#include <queue>
#include "LokiTypeInfo.h"
#include "Thread.h"
#include "Utility.h"


namespace pyr {

    class ByteBuffer;
    class Connection;
    class Packet;
    class ReaderThread;
    class Socket;
    class WriterThread;
    
    
    class PacketHandler {
    public:
        virtual ~PacketHandler() { }
        virtual void processPacket(Connection* c, Packet* p) = 0;
    };
    
    
    template<typename PacketT, typename ClassT>
    class MethodPacketHandler : public PacketHandler {
    public:
        typedef void (ClassT::*MethodPointer)(Connection*, PacketT*);
    
        MethodPacketHandler(ClassT* handler, MethodPointer method) {
            _handler = handler;
            _method  = method;
        }
    
        void processPacket(Connection* c, Packet* p) {
            (_handler->*_method)(c, static_cast<PacketT*>(p));
        }
        
    private:
        ClassT* _handler;
        MethodPointer _method;
    };


    /**
     * This class represents a packet channel between two computers.
     * Packets can be sent, and incoming packets are sent to
     * PacketHandlers.
     */
    class Connection {
    public:
        Connection(Socket* socket);
        ~Connection();

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
        
            TypeInfo ti(typeid(PacketT));
            delete _handlers[ti];
            _handlers[ti] = new HandlerT(handler, method);
        }
        
        /**
         * Call handlers for all available packets in the incoming queue.
         * If a handler is not available for a packet type, put it in the
         * _unhandledPackets list.
         */        
        void processIncomingPackets();

        /// Adds a packet to the outgoing queue, taking ownership of it.
        void sendPacket(Packet* packet);

        /// Returns true if the connection has been closed.
        bool isClosed();
        
        void setOpaque(void* opaque) {
            _opaque = opaque;
        }
        
        void* getOpaque() const {
            return _opaque;
        }
        
    private:
        typedef std::map<TypeInfo, PacketHandler*> HandlerMap;
        typedef HandlerMap::iterator HandlerMapItr;
    
        ScopedPtr<Socket> _tcpSocket;
        
        ReaderThread* _reader;
        WriterThread* _writer;
        ScopedPtr<Thread> _readerThread;
        ScopedPtr<Thread> _writerThread;
        
        std::vector<Packet*> _unhandledPackets;
        HandlerMap _handlers;
        
        /// Used to store user-defined, connection-specific data.
        void* _opaque;
    };

}


#endif
