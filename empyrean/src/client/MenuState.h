#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include <phui/phui.h>
#include "State.h"


namespace pyr {

    class MenuScreen;
    class MainScreen;
    class ConnectScreen;
    class ConnectingScreen;
    class JoinGameScreen;
    class LoginScreen;
    class LoggingInScreen;
    class LobbyScreen;
    class NewGameScreen;

    class MenuState : public State {
    public:
        MenuState();
        ~MenuState();

        void draw(float fade);
        void update(float dt);
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        
        // screen callbacks below
        
        void onErrorOK();
        
        void onMainConnect();
        void onMainOptions();
        void onMainQuit();
        
        void onConnectConnect(const std::string& server, int port);
        void onConnectCancel();
        
        void onConnectingConnected();
        void onConnectingCancel();
        void onConnectingError(const std::string& error);
        
        void onLoginLogin(
            const std::string& username,
            const std::string& password,
            bool newuser);
        void onLoginCancel();
        
        void onLoggingInLoggedIn();
        void onLoggingInCancel();
        void onLoggingInError(const std::string& error);
        
        void onLobbyJoinGame();
        void onLobbyNewGame();
        void onLobbyNewChar();
        void onLobbyQuit();
        void onLobbySay(const std::string& text);
        
        void onJoinGameJoin(const std::string& name, const std::string& password);
        void onJoinGameCancel();

        void onNewGameCreate(const std::string& name, const std::string& password);
        void onNewGameCancel();

    private:
        void createInterface();
        void createMainScreen();
        void createLoginScreen();
        
    
        phui::RefPtr<MenuScreen> _screen;
        
        phui::RefPtr<MainScreen>       _mainScreen;
        phui::RefPtr<ConnectScreen>    _connectScreen;
        phui::RefPtr<ConnectingScreen> _connectingScreen;
        phui::RefPtr<LoginScreen>      _loginScreen;
        phui::RefPtr<LoggingInScreen>  _loggingInScreen;
        phui::RefPtr<LobbyScreen>      _lobbyScreen;
        phui::RefPtr<JoinGameScreen>   _joinGameScreen;
        phui::RefPtr<NewGameScreen>    _newGameScreen;
    };

}


#endif
