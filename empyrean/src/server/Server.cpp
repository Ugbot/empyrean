#include "Connection.h"
#include "Database.h"
#include "Game.h"
#include "PacketTypes.h"
#include "Server.h"
#include "ServerConnectionData.h"
#include "ServerLog.h"


namespace pyr {

    Server::~Server() {
        clearConnections();

        for_each(_games.begin(), _games.end(), delete_function<Game>);
        _games.clear();
    }

    void Server::update(float dt) {
        ConnectionHolder::update();

        // update games
        for (unsigned i = 0; i < _games.size(); ++i) {
            Game* g = _games[i];
            g->update(dt);
        }
    }

    ServerConnectionData* Server::getData(Connection* c) {
        return checked_cast<ServerConnectionData*>(c->getData());
    }

    Game* Server::getGame(const std::string& name) {
        for (size_t i = 0; i < _games.size(); ++i) {
            if (_games[i]->getName() == name) {
                return _games[i];
            }
        }
        return 0;
    }

    void Server::connectionAdded(Connection* connection) {
        PYR_SERVER_LOG() << "Connection from address " << italic(connection->getPeerAddress());

        // Set up connection-specific data.
        ServerConnectionData* cd = dynamic_cast<ServerConnectionData*>(connection->getData());
        if (cd) {
            // Connection has come back from another holder.  Reset the data
            // object, but preserve the data that makes sense.
            cd = new ServerConnectionData(*cd);
        } else {
            // Assign new data.
            cd = new ServerConnectionData;
            cd->loggedIn = false;
            cd->account = 0;
        }
        connection->setData(cd);

        // set up packet handlers
        connection->definePacketHandler(this, &Server::handleLogin);
        connection->definePacketHandler(this, &Server::handleSay);
        connection->definePacketHandler(this, &Server::handleJoinGame);
    }

    void Server::connectionRemoved(Connection* connection) {
        ServerConnectionData* cd = getData(connection);

        if (cd->loggedIn) {
            announceLogout(connection);
        }

        // This might have to explicitly unregister the handlers we set
        // instead of clearing them all.
        connection->clearHandlers();

        // Don't say the client disconnected if it only went to another
        // ConnectionHolder.
        if (connection->isClosed()) {
            PYR_SERVER_LOG() << italic(connection->getPeerAddress()) << " disconnected";
        }
    }

    void Server::handleLogin(Connection* c, LoginPacket* p) {
        ServerConnectionData* cd = getData(c);
        if (cd->loggedIn) {
            c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
            PYR_SERVER_LOG() << italic(p->username()) << " attempted to log in twice!";
            return;
        }

        /// @todo  test for invalid username

        for (size_t i = 0; i < getConnectionCount(); ++i) {
            ServerConnectionData* cdi = getData(getConnection(i));
            if (cdi != cd && cdi->account && cdi->account->getUsername() == p->username()) {
                c->sendPacket(new LoginResponsePacket(LR_ALREADY_LOGGED_IN));
                PYR_SERVER_LOG() << italic(p->username()) << " already logged in!";
                return;
            }
        }

        AccountPtr account = the<Database>().getAccount(p->username());
        if (p->newAccount()) {
            if (account) {
                c->sendPacket(new LoginResponsePacket(LR_ACCOUNT_TAKEN));
                PYR_SERVER_LOG() << italic(p->username()) << ": account taken!";
            } else {
                account = new Account(p->username(), p->password());
                the<Database>().addAccount(account);
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

    void Server::handleSay(Connection* c, SayPacket* p) {
        ServerConnectionData* cd = getData(c);
        sendAll(new LobbyPacket(cd->account->getUsername(),
                                LOBBY_SAY,
                                p->text()));

        PYR_SERVER_LOG() << italic(cd->account->getUsername()) << " says: " << p->text();
    }

    void Server::handleJoinGame(Connection* c, JoinGamePacket* p) {
        ServerConnectionData* cd = getData(c);

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

    void Server::announceLogin(Connection* c) {
        ServerConnectionData* cd = getData(c);
        sendAllBut(c, new LobbyPacket(cd->account->getUsername(),
                                      LOBBY_LOGIN, ""));
    }

    void Server::announceLogout(Connection* c) {
        ServerConnectionData* cd = getData(c);
        sendAllBut(c, new LobbyPacket(cd->account->getUsername(),
                                      LOBBY_LOGOUT, ""));
    }

}
