#ifndef PYR_MAIN_MENU_WINDOW_H
#define PYR_MAIN_MENU_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class MenuState;

    class MainMenuWindow : public phui::Window, public phui::ModalListener {
    public:
        MainMenuWindow(MenuState* state);

    private:
        void onConnectToServer(const phui::ActionEvent&);
        void onOptions(const phui::ActionEvent&);
        void onCredits(const phui::ActionEvent&);
        void onQuit(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);

    private:
        MenuState* _state;
    };

}


#endif
