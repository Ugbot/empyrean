#include <SDL_opengl.h>
#include "GameState.h"
#include "IntroState.h"
#include "Texture.h"


namespace pyr {

    IntroState::IntroState() {
        _image = new Texture("game/images/empyrean.png");
    }

    void IntroState::draw(float fade) {
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(1, 1, 1, 1 - fade);
        _image->drawRectangle(0, 0, 1, 1);
    }
    
    void IntroState::onKeyPress(SDLKey /*key*/, bool down) {
        if (down) {
            invokeTimedTransition<GameState>(1);
        }
    }
    
    void IntroState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            invokeTimedTransition<GameState>(1);
        }
    }

}
