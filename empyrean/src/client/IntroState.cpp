#include <SDL_opengl.h>
#include "GameState.h"
#include "IntroState.h"
#include "Texture.h"


namespace pyr {

    IntroState::IntroState() {
        _image = new Texture("game/images/empyrean.png");
    }

    void IntroState::draw() {
        glEnable(GL_TEXTURE_2D);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        _image->drawRectangle(0, 0, 1, 1);
    }
    
    void IntroState::onKeyPress(SDLKey /*key*/, bool down) {
        if (down) {
            invokeTransition<GameState>();
        }
    }
    
    void IntroState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            invokeTransition<GameState>();
        }
    }

}
