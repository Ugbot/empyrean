#ifndef PYR_JOIN_GAME_WINDOW_H
#define PYR_JOIN_GAME_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class JoinGameWindow : public phui::Window, public phui::ModalListener {
    public:
        JoinGameWindow();

    private:
        void onJoin(const phui::ActionEvent&);
        void onCancel(const phui::ActionEvent&);
         
        void onEndModal(Widget* widget, int result);

        phui::TextFieldPtr _game;
        phui::TextFieldPtr _password;
    };

}


#endif
