#include "Connection.h"
#include "Log.h"
#include "PacketTypes.h"
#include "ServerEntity.h"
#include "World.h"


namespace pyr {

    World::~World() {
        while (!_connections.empty()) {
            removeConnection(0);
        }
    }
    
    void World::update(float dt) {
        // update connections
        for (unsigned i = 0; i < _connections.size(); ++i) {
            Connection* c = _connections[i];
            
            // if the connection is dead, it must be removed
            if (c->isClosed()) {
                removeConnection(i);
                continue;
            }
            
            c->processIncomingPackets();
            

            // XXX so disconnection isn't delayed...
            c->sendPacket(new PingPacket());
        }
    }
    
    void World::addConnection(Connection* connection) {
        logMessage("Connection from address " + connection->getAddress());

        ConnectionData* cd = new ConnectionData;
        cd->loggedIn = false;
        cd->account = 0;
        connection->setOpaque(cd);

        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);

        // add the connection to the list of connections
        _connections.push_back(connection);
    }
    
    void World::removeConnection(unsigned index) {
        Connection* connection = _connections[index];
        
        ConnectionData* cd = (ConnectionData*)connection->getOpaque();
        delete cd;
        
        _connections.erase(_connections.begin() + index);
        delete connection;
        
        logMessage("Disconnected");
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        ConnectionData* cd = (ConnectionData*)c->getOpaque();
        if (cd->loggedIn) {
            c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
            logMessage(p->username() + " attempted to log in twice!");
            return;
        }

        /// @todo  test for invalid username
        /// @todo  test for already logged in
        
        Account* account = _database.getAccount(p->username());
        if (p->newAccount()) {
            if (account) {
                c->sendPacket(new LoginResponsePacket(LR_ACCOUNT_TAKEN));
                logMessage(p->username() + ": account taken!");
            } else {
                account = new Account(p->username(), p->password());
                _database.addAccount(account);
                cd->account = account;
                cd->loggedIn = true;
                c->sendPacket(new LoginResponsePacket(LR_LOGGED_IN));
                logMessage(p->username() + " new account, logged in");
            }
            return;
        }
        
        if (!account) {
            c->sendPacket(new LoginResponsePacket(LR_NO_ACCOUNT));
            logMessage(p->username() + " doesn't exist");
        } else {
            if (p->password() == account->getPassword()) {
                cd->account = account;
                cd->loggedIn = true;
                c->sendPacket(new LoginResponsePacket(LR_LOGGED_IN));
                logMessage(p->username() + " logged in");
            } else {
                c->sendPacket(new LoginResponsePacket(LR_INVALID_PASSWORD));
                logMessage(p->username() + " invalid password");
            }
        }
    }

}
