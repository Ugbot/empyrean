#include "Connection.h"
#include "Database.h"
#include "Game.h"
#include "PacketTypes.h"
#include "ServerLog.h"
#include "World.h"


namespace pyr {

    World::~World() {
        clearConnections();
        
        for_each(_games.begin(), _games.end(), delete_function<Game>);
        _games.clear();
    }

    void World::update(float dt) {
        ConnectionHolder::update();

        // update games
        for (unsigned i = 0; i < _games.size(); ++i) {
            Game* g = _games[i];
            g->update(dt);
        }
    }
    
    World::ConnectionData* World::getData(Connection* c) {
        return static_cast<ConnectionData*>(c->getOpaque());
    }
    
    Game* World::getGame(const std::string& name) {
        for (size_t i = 0; i < _games.size(); ++i) {
            if (_games[i]->getName() == name) {
                return _games[i];
            }
        }
        return 0;
    }
    
    std::string italic(const std::string& s) {
        return "<i>" + s + "</i>";
    }
    
    void World::connectionAdded(Connection* connection) {
        PYR_SERVER_LOG() << "Connection from address " << italic(connection->getPeerAddress());

        // set up connection-specific data
        ConnectionData* cd = new ConnectionData;
        cd->loggedIn = false;
        cd->account = 0;
        connection->setOpaque(cd);

        // set up packet handlers
        connection->definePacketHandler(this, &World::handleLogin);
        connection->definePacketHandler(this, &World::handleSay);
        connection->definePacketHandler(this, &World::handleJoinGame);
        connection->definePacketHandler(this, &World::handleNewCharacter);
    }

    void World::connectionRemoved(Connection* connection) {
        ConnectionData* cd = getData(connection);
        
        if (cd->loggedIn) {
            announceLogout(connection);
        }
        
        delete cd;

        connection->setOpaque(0);
        connection->clearHandlers();
        
        if (connection->isClosed()) {
            PYR_SERVER_LOG() << italic(connection->getPeerAddress()) << " disconnected";
        }
    }
    
    void World::handleLogin(Connection* c, LoginPacket* p) {
        ConnectionData* cd = getData(c);
        if (cd->loggedIn) {
            c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
            PYR_SERVER_LOG() << italic(p->username()) << " attempted to log in twice!";
            return;
        }

        /// @todo  test for invalid username
        /// @todo  test for already logged in

        for (size_t i = 0; i < getConnectionCount(); ++i) {
            ConnectionData* cdi = getData(getConnection(i));
            if (cdi != cd && cdi->account && cdi->account->getUsername() == p->username()) {
                c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
                PYR_SERVER_LOG() << italic(p->username()) << " already logged in!";
                return;
            }
        }
        
        Account* account = Database::instance().getAccount(p->username());
        if (p->newAccount()) {
            if (account) {
                c->sendPacket(new LoginResponsePacket(LR_ACCOUNT_TAKEN));
                PYR_SERVER_LOG() << italic(p->username()) << ": account taken!";
            } else {
                account = new Account(p->username(), p->password());
                Database::instance().addAccount(account);
                cd->account = account;
                cd->loggedIn = true;
                c->sendPacket(new LoginResponsePacket(LR_LOGGED_IN));
                PYR_SERVER_LOG() << italic(p->username()) << " new account, logged in";

                announceLogin(c);
            }
            return;
        }
        
        if (!account) {
            c->sendPacket(new LoginResponsePacket(LR_NO_ACCOUNT));
            PYR_SERVER_LOG() << italic(p->username()) << " doesn't exist";
        } else {
            if (p->password() == account->getPassword()) {
                cd->account = account;
                cd->loggedIn = true;
                c->sendPacket(new LoginResponsePacket(LR_LOGGED_IN));
                PYR_SERVER_LOG() << italic(p->username()) << " logged in";
                
                announceLogin(c);
            } else {
                c->sendPacket(new LoginResponsePacket(LR_INVALID_PASSWORD));
                PYR_SERVER_LOG() << italic(p->username()) << " invalid password";
            }
        }
    }

    void World::handleSay(Connection* c, SayPacket* p) {
        ConnectionData* cd = getData(c);
        sendAll(new LobbyPacket(cd->account->getUsername(),
                                LOBBY_SAY,
                                p->text()));

        PYR_SERVER_LOG() << italic(cd->account->getUsername()) << " says: " << p->text();
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
            PYR_SERVER_LOG() << italic(username) << " tried to create/join game with no name";
            return;
        }
        
        Game* game = getGame(p->name());
        if (p->newGame()) {
            if (game) {
                // Error: game already started
                c->sendPacket(new JoinGameResponsePacket(JGR_ALREADY_STARTED));
                PYR_SERVER_LOG() << italic(username) << ": game " << italic(p->name()) << " already started";
            } else {
                // Success: game created
                game = new Game(p->name(), p->password());
                _games.push_back(game);
                c->sendPacket(new JoinGameResponsePacket(JGR_JOINED));
                PYR_SERVER_LOG() << italic(username) << " created game " << italic(p->name());
                
                giveConnection(c, game);
            }
        } else {
            if (!game) {
                // Error: game doesn't exist
                c->sendPacket(new JoinGameResponsePacket(JGR_NO_GAME));
                PYR_SERVER_LOG() << italic(username) << " tried to join nonexistant game " << italic(p->name());
            } else if (game->getPassword() != p->password()) {
                // Error: invalid password
                c->sendPacket(new JoinGameResponsePacket(JGR_INVALID_PASSWORD));
                PYR_SERVER_LOG() << italic(username) << ": invalid password for game " << italic(p->name());
            } else {
                // Success: game joined
                c->sendPacket(new JoinGameResponsePacket(JGR_JOINED));
                PYR_SERVER_LOG() << italic(username) << " joined game " << italic(p->name());
                
                giveConnection(c, game);
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
            PYR_SERVER_LOG() << italic(username) << " tried to create character with no name";
            return;
        }
        
        Character* character = Database::instance().getCharacter(p->name());
        if (character) {
            c->sendPacket(new NewCharacterResponsePacket(NCR_ALREADY_TAKEN));
            PYR_SERVER_LOG() << italic(username) << " tried to create character " << italic(p->name()) << ", but name was already taken";
        } else {
            Database::instance().addCharacter(new Character(p->name()));
            c->sendPacket(new NewCharacterResponsePacket(NCR_SUCCESS));
            PYR_SERVER_LOG() << italic(username) << " created character " << italic(p->name());
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
