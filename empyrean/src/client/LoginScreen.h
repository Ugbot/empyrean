#ifndef PYR_LOGIN_SCREEN_H
#define PYR_LOGIN_SCREEN_H


#include "MenuScreen.h"


namespace pyr {

    class LoginScreen : public MenuScreen {
    public:
        LoginScreen(MenuState* state)
            : MenuScreen(state)
        {
            phui::LabelPtr nameLabel = new phui::Label("Name");
            nameLabel->setPositionAndSize(0, 0, 512, 192);
            
            _name = new phui::TextField(Configuration::instance().getUsername());
            _name->setPositionAndSize(512, 0, 512, 192);
            
            phui::LabelPtr passwordLabel = new phui::Label("Password");
            passwordLabel->setPositionAndSize(0, 192, 512, 192);
            
            _password = new phui::TextField();
            _password->setPositionAndSize(512, 192, 512, 192);
            
            _newuser = new phui::CheckBox("New User");
            _newuser->setPositionAndSize(0, 384, 1024, 192);
            
            _login = new phui::Button("Login");
            _login->addListener(this, &LoginScreen::onLogin);
            _login->setPositionAndSize(0, 576, 512, 192);
            
            _cancel = new phui::Button("Cancel");
            _cancel->addListener(this, &LoginScreen::onCancel);
            _cancel->setPositionAndSize(512, 576, 512, 192);
            
            add(nameLabel);
            add(_name);
            add(passwordLabel);
            add(_password);
            add(_newuser);
            add(_login);
            add(_cancel);
        }
        
    private:
        void onLogin(const phui::ActionEvent&) {
            getState()->onLoginLogin(
                _name->getText(),
                _password->getText(),
                _newuser->isChecked());
        }
        
        void onCancel(const phui::ActionEvent&) {
            getState()->onLoginCancel();
        }
    
        phui::TextFieldPtr _name;
        phui::TextFieldPtr _password;
        phui::CheckBoxPtr  _newuser;
        phui::ButtonPtr    _login;
        phui::ButtonPtr    _cancel;
    };
    
}


#endif
