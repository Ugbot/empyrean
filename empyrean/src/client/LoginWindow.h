#ifndef PYR_LOGIN_WINDOW_H
#define PYR_LOGIN_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class LoginWindow : public phui::Window, public phui::ModalListener {
    public:
        LoginWindow();
        
    private:
        void onLogin(const phui::ActionEvent&);
        void onCancel(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);
        
        phui::TextFieldPtr _username;
        phui::TextFieldPtr _password;
        phui::CheckBoxPtr _newUser;

    };

}


#endif
