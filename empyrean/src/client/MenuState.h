#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include "State.h"
#include "MultiTextureImage.h"

namespace pyr {

    class MenuState : public State {
    public:
        MenuState();
        
        void draw(float fade);
        void onMousePress(Uint8 button, bool down, int x, int y);

    private:
        //MultiTextureImage main, bg1, bg2, sky;
        MultiTextureImage connectbutton, optionsbutton, exitbutton;        
    };

}


#endif
