#include "GLUtility.h"
#include "IntroState.h"
#include "MenuState.h"
#include "OpenGL.h"
#include "Texture.h"


namespace pyr {

    IntroState::IntroState() 
        : _image(Texture::create("images/intro.tga"))
    {
    }

    void IntroState::draw(float fade) {
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        
        setOrthoProjection(1, 1);
    
        glClear(GL_COLOR_BUFFER_BIT);
        glColor4f(1, 1, 1, 1 - fade);
        _image->drawRectangle(0, 0, 1, 1);
    }
    
    void IntroState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            if (key == SDLK_ESCAPE) {
                quit();
            } else {
                invokeTransition<MenuState>();
            }
        }
    }
    
    void IntroState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            invokeTransition<MenuState>();
        }
    }

}
