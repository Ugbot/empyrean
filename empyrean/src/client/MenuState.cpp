#include <phui/SDLBridge.h>
#include "ConnectScreen.h"
#include "ConnectingScreen.h"
#include "ErrorScreen.h"
#include "GameState.h"
#include "JoinGameScreen.h"
#include "JoiningGameScreen.h"
#include "LobbyScreen.h"
#include "LoggingInScreen.h"
#include "LoginScreen.h"
#include "MainScreen.h"
#include "MenuState.h"
#include "NewGameScreen.h"
#include "OptionsState.h"
#include "ServerConnection.h"
#include "Texture.h"


namespace pyr {

    MenuState::MenuState() {
        createInterface();
        showPointer();
    }

    MenuState::~MenuState() {
        // destructor has to be here because screens aren't defined in
        // the header file
    }
    
    void MenuState::draw(float fade) {
        glDisable(GL_DEPTH_TEST);
        glDisable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(0, 0, 0, 1 - fade);
        glBegin(GL_TRIANGLE_FAN);
        glVertex2f(0, 0);
        glVertex2f(0, 1);
        glVertex2f(1, 1);
        glVertex2f(1, 0);
        glEnd();
        
        glDisable(GL_TEXTURE_2D);
        _screen->draw();
        
        glEnable(GL_TEXTURE_2D);
    }
    
    void MenuState::update(float dt) {
        _screen->update(dt);
        ServerConnection::instance().update();
    }
    
    void MenuState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            _screen->genKeyDownEvent(phui::SDLToPhuiKey(key));
        } else {
            _screen->genKeyUpEvent(phui::SDLToPhuiKey(key));
        }
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        const phui::Point p(x, y);
        if (down) {
            _screen->genMouseDownEvent(phui::SDLToPhuiButton(button), p);
        } else {
            _screen->genMouseUpEvent(phui::SDLToPhuiButton(button), p);
        }
    }
    
    void MenuState::onMouseMove(int x, int y) {
        _screen->genMouseMoveEvent(phui::Point(x, y));
    }
    
    void MenuState::onErrorOK() {
        _screen = _mainScreen;
    }
    
    void MenuState::onMainConnect() {
        _screen = _connectScreen;
    }
    
    void MenuState::onMainOptions() {
        invokeTransition<OptionsState>();
    }
    
    void MenuState::onMainQuit() {
        quit();
    }
    
    void MenuState::onConnectConnect(const std::string& server, int port) {
        ServerConnection::instance().beginConnecting(server, port);
        _screen = _connectingScreen;
    }
    
    void MenuState::onConnectCancel() {
        _screen = _mainScreen;
    }
    
    void MenuState::onConnectingConnected() {
        _screen = _loginScreen;
    }
    
    void MenuState::onConnectingCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onConnectingError(const std::string& error) {
        _screen = new ErrorScreen(this, error);
    }
    
    void MenuState::onLoginLogin(
        const std::string& username,
        const std::string& password,
        bool newuser)
    {
        ServerConnection::instance().login(username, password, newuser);
        _screen = _loggingInScreen;
    }
    
    void MenuState::onLoginCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onLoggingInLoggedIn() {
        _screen = _lobbyScreen;
    }
    
    void MenuState::onLoggingInCancel() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }
    
    void MenuState::onLoggingInError(const std::string& error) {
        ServerConnection::instance().disconnect();
        _screen = new ErrorScreen(this, "Error logging in: " + error);
    }
    
    void MenuState::onLobbyJoinGame() {
        _screen = _joinGameScreen;
    }

    void MenuState::onLobbyNewGame() {
        _screen = _newGameScreen;
    }

    void MenuState::onLobbyNewChar() {
    }

    void MenuState::onLobbyQuit() {
        ServerConnection::instance().disconnect();
        _screen = _mainScreen;
    }

    void MenuState::onLobbySay(const std::string& text) {
        ServerConnection::instance().say(text);
    }
    
    void MenuState::onJoinGameJoin(const std::string& name, const std::string& password) {
        ServerConnection::instance().joinGame(name, password, false);
        _screen = _joiningGameScreen;
    }
    
    void MenuState::onJoinGameCancel() {
        _screen = _lobbyScreen;
    }
    
    void MenuState::onNewGameCreate(const std::string& name, const std::string& password) {
        ServerConnection::instance().joinGame(name, password, true);
        _screen = _joiningGameScreen;
    }

    void MenuState::onNewGameCancel() {
        _screen = _lobbyScreen;
    }
    
    void MenuState::onJoiningGameJoined() {
        invokeTransition<GameState>();
    }
    
    void MenuState::onJoiningGameCancel() {
        _screen = _lobbyScreen;
    }
    
    void MenuState::onJoiningGameError(const std::string& error) {
        ServerConnection::instance().disconnect();
        _screen = new ErrorScreen(this, error);
    }

    void MenuState::onCreatingGameCancel() {
        _screen = _lobbyScreen;
    }
    
    void MenuState::createInterface() {
        _mainScreen         = new MainScreen(this);
        _connectScreen      = new ConnectScreen(this);
        _connectingScreen   = new ConnectingScreen(this);
        _joinGameScreen     = new JoinGameScreen(this);
        _joiningGameScreen  = new JoiningGameScreen(this);
        _loginScreen        = new LoginScreen(this);
        _loggingInScreen    = new LoggingInScreen(this);
        _lobbyScreen        = new LobbyScreen(this);
        _newGameScreen      = new NewGameScreen(this);
        
        _screen = _mainScreen;
    }
    
}
