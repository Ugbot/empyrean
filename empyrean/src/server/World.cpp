#include "Connection.h"
#include "Database.h"
#include "Game.h"
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
        
        // update games
        for (unsigned i = 0; i < _games.size(); ++i) {
            Game* g = _games[i];
            g->update(dt);
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
        connection->definePacketHandler(this, &World::handleJoinGame);
        connection->definePacketHandler(this, &World::handleNewCharacter);

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
    
    void World::sendAll(Packet* p) {
        for (size_t i = 0; i < _connections.size(); ++i) {
            _connections[i]->sendPacket(p);
        }
    }
    
    void World::sendAllBut(Connection* c, Packet* p) {
        for (size_t i = 0; i < _connections.size(); ++i) {
            if (_connections[i] != c) {
                _connections[i]->sendPacket(p);
            }
        }
    }
    
    Game* World::getGame(const std::string& name) {
        for (size_t i = 0; i < _games.size(); ++i) {
            if (_games[i]->getName() == name) {
                return _games[i];
            }
        }
        return 0;
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
        sendAll(new LobbyPacket(cd->account->getUsername(),
                                LOBBY_SAY,
                                p->text()));

        logMessage(cd->account->getUsername() + " says: " + p->text());
    }
    
    void World::handleJoinGame(Connection* c, JoinGamePacket* p) {
        ConnectionData* cd = getData(c);
        
        if (!cd->account) {
            // ignore packet, must log in first
            return;
        }
        
        std::string username = cd->account->getUsername();
        
        if (p->name().empty()) {
            c->sendPacket(new JoinGameResponsePacket(JGR_INVALID_NAME));
            logMessage(username + " tried to create/join game with no name");
            return;
        }
        
        Game* game = getGame(p->name());
        if (p->newGame()) {
            if (game) {
                c->sendPacket(new JoinGameResponsePacket(JGR_ALREADY_STARTED));
                logMessage(username + ": game: " + p->name() + " already started");
            } else {
                game = new Game(p->name(), p->password());
                _games.push_back(game);
                c->sendPacket(new JoinGameResponsePacket(JGR_JOINED));
                logMessage(username + " created game " + p->name());
            }
        } else {
            if (!game) {
                c->sendPacket(new JoinGameResponsePacket(JGR_NO_GAME));
                logMessage(username + " tried to join nonexistant game " + p->name());
            } else if (game->getPassword() != p->password()) {
                c->sendPacket(new JoinGameResponsePacket(JGR_INVALID_PASSWORD));
                logMessage(username + ": invalid password for game " + p->name());
            } else {
                c->sendPacket(new JoinGameResponsePacket(JGR_JOINED));
                logMessage(username + " joined game " + p->name());
            }
        }
    }
    
    void World::handleNewCharacter(Connection* c, NewCharacterPacket* p) {
        ConnectionData* cd = getData(c);
        
        if (!cd->account) {
            // ignore packet, must log in first
            return;
        }
        
        std::string username = cd->account->getUsername();
        
        if (p->name().empty()) {
            c->sendPacket(new NewCharacterResponsePacket(NCR_INVALID_NAME));
            logMessage(username + " tried to create character with no name");
            return;
        }
        
        Character* character = Database::instance().getCharacter(p->name());
        if (character) {
            c->sendPacket(new NewCharacterResponsePacket(NCR_ALREADY_TAKEN));
            logMessage(username + " tried to create character " + p->name() + ", but name was already taken");
        } else {
            Database::instance().addCharacter(new Character(p->name()));
            c->sendPacket(new NewCharacterResponsePacket(NCR_SUCCESS));
            logMessage(username + " created character " + p->name());
        }
    }
    
    void World::announceLogin(Connection* c) {
        ConnectionData* cd = getData(c);
        sendAllBut(c, new LobbyPacket(cd->account->getUsername(),
                                      LOBBY_LOGIN, ""));
    }
    
    void World::announceLogout(Connection* c) {
        ConnectionData* cd = getData(c);
        sendAllBut(c, new LobbyPacket(cd->account->getUsername(),
                                      LOBBY_LOGOUT, ""));
    }
    
}
