#ifndef PYR_MENU_SCREEN_H
#define PYR_MENU_SCREEN_H


#include <phui/phui.h>
#include "Application.h"


namespace pyr {

    class MenuState;
    
    class MenuScreen : public phui::RootWidget {
    public:
        MenuScreen(MenuState* state)
            : phui::RootWidget(Application::instance().getWidth(),
                               Application::instance().getHeight())
        {
            _state = state;
            hidePointer();
        }
        
    protected:
        MenuState* getState() const {
            return _state;
        }
        
    private:
        MenuState* _state;
    };
    
}


#endif
