#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include <phui/phui.h>
#include "UIState.h"


namespace pyr {

    class MenuState : public UIState {
    public:
        MenuState();

        void update(float dt);
        
        // Main menu callbacks.
        void onOptions();
        void onCredits();
        void onQuit();
        void onLoggedIn();
    };

}


#endif
