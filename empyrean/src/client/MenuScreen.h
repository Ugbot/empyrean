#ifndef PYR_MENU_SCREEN_H
#define PYR_MENU_SCREEN_H


#include <phui/phui.h>
#include "Application.h"


namespace pyr {

    class MenuState;
    
    class MenuScreen : public RootWidget {
    public:
        MenuScreen(MenuState* state)
            : RootWidget(Application::instance().getWidth(),
                         Application::instance().getHeight())
        {
            _state = state;
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
