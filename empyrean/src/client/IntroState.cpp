#include <SDL_opengl.h>
#include "IntroState.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    IntroState::IntroState() {
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        _image = new Texture("images/intro.png");
    }

    void IntroState::draw(float fade) {
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
            invokeTimedTransition<MenuState>(1);
        }
    }
    
    void IntroState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            invokeTimedTransition<MenuState>(1);
        }
    }

}
