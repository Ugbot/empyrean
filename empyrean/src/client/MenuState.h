#ifndef PYR_MENU_STATE_H
#define PYR_MENU_STATE_H


#include "State.h"


namespace pyr {

    class Texture;

    class MenuState : public State {
    public:
        MenuState();
        
        void draw(float fade);
        void onMousePress(Uint8 button, bool down, int x, int y);

    private:
        Texture* _tex1;
        Texture* _tex2;
        Texture* _tex3;
        Texture* _tex4;
    };

}


#endif