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

    private:
        void createInterface();
        void createMainScreen();
        void createLoginScreen();
        
        void onButtonPressed(const phui::ActionEvent& e);
        
    
        phui::RootWidgetPtr _root;
        
        phui::RootWidgetPtr _mainRoot;
        phui::ButtonPtr _connect;
        phui::ButtonPtr _options;
        phui::ButtonPtr _quit;
        
        phui::RootWidgetPtr _loginRoot;
        phui::TextFieldPtr _name;
        phui::TextFieldPtr _password;
        phui::CheckBoxPtr  _newuser;
        phui::ButtonPtr    _login;
        phui::ButtonPtr    _cancel;
    };

}


#endif
