#ifndef PYR_UI_STATE_H
#define PYR_UI_STATE_H


#include <phui/phui.h>
#include "State.h"


namespace pyr {

    class UIState : public State {
    public:
        UIState();

        void update(float dt);
        void draw();

        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        void onJoyPress(Uint8 button, bool down);
        void onJoyMove(int axis, float value);
        
    protected:
        phui::RootWidgetPtr getRoot() const {
            return _root;
        }
        
    private:
        phui::RootWidgetPtr _root;
    
        // For controlling menu with joystick
        Zeroed<int> _joyVelX;
        Zeroed<int> _joyVelY;
    };

}


#endif
