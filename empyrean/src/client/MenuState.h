#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include <phui/phui.h>
#include "State.h"


namespace pyr {

    class MenuState : public State {
    public:
        MenuState();
        
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
        
        void onSay(const std::string& text);

    private:
        void createInterface();
        void createMainScreen();
        void createLoginScreen();
        
    
        phui::RootWidgetPtr _screen;
        
        phui::RootWidgetPtr _mainScreen;
        phui::RootWidgetPtr _connectScreen;
        phui::RootWidgetPtr _connectingScreen;
        phui::RootWidgetPtr _loginScreen;
        phui::RootWidgetPtr _loggingInScreen;
        phui::RootWidgetPtr _chatScreen;
    };

}


#endif
