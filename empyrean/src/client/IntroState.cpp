#include "extgl.h"
#include "GameState.h"
#include "IntroState.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    IntroState::IntroState() 
        : _image(Texture::create("images/intro.png"))
    {
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
        
        glClear(GL_COLOR_BUFFER_BIT);
        glColor4f(1, 1, 1, 1 - fade);
        _image->drawRectangle(0, 0, 1, 1);
    }
    
    void IntroState::onKeyPress(SDLKey /*key*/, bool down) {
        if (down) {
            //invokeTimedTransition<MenuState>(1);
            invokeTimedTransition<GameState>(1);
        }
    }
    
    void IntroState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            //invokeTimedTransition<MenuState>(1);
            invokeTimedTransition<GameState>(1);
        }
    }

}
