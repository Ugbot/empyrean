#include "Connection.h"
#include "Database.h"
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
        }
    }
    
    void World::addConnection(Connection* connection) {
        logMessage("Connection from address " + connection->getPeerAddress());

        ConnectionData* cd = new ConnectionData;
        cd->loggedIn = false;
        cd->account = 0;
        connection->setOpaque(cd);

        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);
        connection->definePacketHandler(this, &World::handleSay);

        // add the connection to the list of connections
        _connections.push_back(connection);
    }

    World::ConnectionData* World::getData(Connection* c) {
        return static_cast<ConnectionData*>(c->getOpaque());
    }
    
    void World::removeConnection(unsigned index) {
        Connection* connection = _connections[index];
        
        ConnectionData* cd = (ConnectionData*)connection->getOpaque();
        
        if (cd->loggedIn) {
            announceLogout(connection);
        }
        
        delete cd;
        
        _connections.erase(_connections.begin() + index);
        delete connection;
        
        logMessage("Disconnected");
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        ConnectionData* cd = getData(c);
        if (cd->loggedIn) {
            c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
            logMessage(p->username() + " attempted to log in twice!");
            return;
        }

        /// @todo  test for invalid username
        /// @todo  test for already logged in

        for (size_t i = 0; i < _connections.size(); ++i) {
            ConnectionData* cdi = getData(_connections[i]);
            if (cdi != cd && cdi->account->getUsername() == p->username()) {
                c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
                logMessage(p->username() + " already logged in!");
                return;
            }
        }
        
        Account* account = Database::instance().getAccount(p->username());
        if (p->newAccount()) {
            if (account) {
                c->sendPacket(new LoginResponsePacket(LR_ACCOUNT_TAKEN));
                logMessage(p->username() + ": account taken!");
            } else {
                account = new Account(p->username(), p->password());
                Database::instance().addAccount(account);
                cd->account = account;
                cd->loggedIn = true;
                c->sendPacket(new LoginResponsePacket(LR_LOGGED_IN));
                logMessage(p->username() + " new account, logged in");

                announceLogin(c);
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
                
                announceLogin(c);
            } else {
                c->sendPacket(new LoginResponsePacket(LR_INVALID_PASSWORD));
                logMessage(p->username() + " invalid password");
            }
        }
    }

    void World::handleSay(Connection* c, SayPacket* p) {
        ConnectionData* cd = getData(c);
        for (size_t i = 0; i < _connections.size(); ++i) {
            _connections[i]->sendPacket(new LobbyPacket(
                cd->account->getUsername(),
                LOBBY_SAY,
                p->text()));
        }

        logMessage(cd->account->getUsername() + " says: " + p->text());
    }
    
    void World::announceLogin(Connection* c) {
        ConnectionData* cd = getData(c);
        for (size_t i = 0; i < _connections.size(); ++i) {
            if (_connections[i] != c) {
                _connections[i]->sendPacket(new LobbyPacket(
                    cd->account->getUsername(),
                    LOBBY_LOGIN,
                    ""));
            }
        }
    }
    
    void World::announceLogout(Connection* c) {
        ConnectionData* cd = getData(c);
        for (size_t i = 0; i < _connections.size(); ++i) {
            if (_connections[i] != c) {
                _connections[i]->sendPacket(new LobbyPacket(
                    cd->account->getUsername(),
                    LOBBY_LOGOUT,
                    ""));
            }
        }
    }
    
}
