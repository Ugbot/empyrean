#ifndef PYR_NEW_GAME_WINDOW_H
#define PYR_NEW_GAME_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class NewGameWindow : public phui::Window, public phui::ModalListener {
    public:
        NewGameWindow();

    private:
        void onCreate(const phui::ActionEvent&);
        void onCancel(const phui::ActionEvent&);
         
        void onEndModal(Widget* widget, int result);

        phui::TextFieldPtr _game;
        phui::TextFieldPtr _password;
    };

}


#endif
