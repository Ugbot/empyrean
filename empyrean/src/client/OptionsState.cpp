#include "MenuState.h"
#include "OpenGL.h"
#include "OptionsState.h"
#include "Texture.h"


namespace pyr {

    OptionsState::OptionsState() {
        _image = Texture::create("images/notyet.png");
    }

    void OptionsState::draw(float fade) {
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

    void OptionsState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            invokeTransition<MenuState>();
        }
    }

    void OptionsState::onMousePress(Uint8 /*button*/, bool down, int, int) {
        if (down) {
            invokeTransition<MenuState>();
        }
    }
}
