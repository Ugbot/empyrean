#include "Connection.h"
#include "ConnectionHolder.h"
#include "Packet.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.ConnectionHolder");
    }

    void ConnectionHolder::addConnection(Connection* connection) {
        connection->addReceiver(this);
        connectionAdded(connection);
        _connections.push_back(connection);
    }

    ConnectionHolder::ConnectionHolder() {
    }
    
    ConnectionHolder::~ConnectionHolder() {
        clearConnections();
        PYR_ASSERT(getConnectionCount() == 0, "clearConnections() didn't get rid of all connections.");
    }
    
    void ConnectionHolder::update() {
        PYR_LOG_SCOPE(_logger, INFO, "ConnectionHolder::update");
        for (size_t i = 0; i < getConnectionCount(); ++i) {
            Connection* c = getConnection(i);
            
            // if the connection is dead, it must be removed
            if (c->isClosed()) {
                removeConnection(i);
                continue;
            }
            
            c->processIncomingPackets();
        }
    }
    
    void ConnectionHolder::giveConnection(Connection* c, ConnectionHolder* h) {
        for (size_t i = 0; i < getConnectionCount(); ++i) {
            if (getConnection(i) == c) {
                detachConnection(i);
                h->addConnection(c);                
                return;
            }
        }
        
        PYR_ASSERT(false, "Holder can't give away a connection it doesn't own");
    }
    
    void ConnectionHolder::clearConnections() {
        while (!_connections.empty()) {
            removeConnection(0);
        }
    }

    size_t ConnectionHolder::getConnectionCount() {
        return _connections.size();
    }
    
    Connection* ConnectionHolder::getConnection(size_t i) {
        return _connections[i];
    }
    
    void ConnectionHolder::sendAll(PacketPtr p) {
        for (size_t i = 0; i < _connections.size(); ++i) {
            _connections[i]->sendPacket(p);
        }
    }
    
    void ConnectionHolder::sendAllBut(Connection* c, PacketPtr p) {
        for (size_t i = 0; i < _connections.size(); ++i) {
            if (_connections[i] != c) {
                _connections[i]->sendPacket(p);
            }
        }
    }
    
    Connection* ConnectionHolder::detachConnection(size_t index) {
        Connection* c = getConnection(index);
        _connections.erase(_connections.begin() + index);
        connectionRemoved(c);
        c->removeReceiver(this);
        return c;
    }
    
    void ConnectionHolder::removeConnection(size_t index) {
        delete detachConnection(index);
    }
    
}
