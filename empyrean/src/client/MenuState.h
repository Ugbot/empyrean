#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include <phui/phui.h>
#include "State.h"


namespace pyr {

    class MenuScreen;
    class MainScreen;
    class ConnectingScreen;
    class JoinGameScreen;
    class JoiningGameScreen;
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
        void onJoyPress(Uint8 button, bool down);
        void onJoyMove(int axis, float value);
        // screen callbacks below
        
        void onErrorOK();
        
        void onMainCredits();
        void onMainQuit();
        
        void onConnectConnect(const std::string& server, int port);
        
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
        void onLobbyQuit();
        void onLobbySay(const std::string& text);
        
        void onJoinGameJoin(const std::string& name, const std::string& password);
        void onJoinGameCancel();

        void onNewGameCreate(const std::string& name, const std::string& password);
        void onNewGameCancel();
        
        void onJoiningGameJoined();
        void onJoiningGameCancel();
        void onJoiningGameError(const std::string& error);
        
    private:
        void createInterface();
        void createMainScreen();
        void createLoginScreen();
        
    
        RefPtr<MenuScreen> _screen;
        
        RefPtr<MainScreen>         _mainScreen;
        RefPtr<ConnectingScreen>   _connectingScreen;
        RefPtr<JoinGameScreen>     _joinGameScreen;
        RefPtr<JoiningGameScreen>  _joiningGameScreen;
        RefPtr<LoginScreen>        _loginScreen;
        RefPtr<LoggingInScreen>    _loggingInScreen;
        RefPtr<LobbyScreen>        _lobbyScreen;
        RefPtr<NewGameScreen>      _newGameScreen;

        // For controlling menu with joystick
        Zeroed<int> _joyVelX;
        Zeroed<int> _joyVelY;
    };

}


#endif
