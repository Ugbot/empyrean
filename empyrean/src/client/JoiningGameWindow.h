#ifndef PYR_JOINING_GAME_WINDOW_H
#define PYR_JOINING_GAME_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class JoiningGameWindow : public phui::Window, public phui::ModalListener {
    public:
        JoiningGameWindow();

        void update(float dt);

    private:
        void onCancel(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);
    };

}


#endif
