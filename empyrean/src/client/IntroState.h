#ifndef PYR_INTRO_STATE_H
#define PYR_INTRO_STATE_H


#include "State.h"


namespace pyr {

    class Texture;

    class IntroState : public State {
    public:
        IntroState();
        
        void draw();
        
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        
    private:
        ScopedPtr<Texture> _image;  
    };
    
}


#endif
