#include "AudioSystem.h"
#include "GLUtility.h"
#include "IntroState.h"
#include "OpenGL.h"
#include "Renderer.h"
#include "Texture.h"


namespace pyr {

    class MenuState;

    IntroState::IntroState()
    : _image(Texture::create("images/intro.tga")) {
        showPointer();
        the<AudioSystem>().playMusic("music/menuTheme.mp3");
    }

    void IntroState::draw() {
        beginPass(OrthoProjection(1, 1));
        drawTexture(Vec2f(0, 0), Vec2f(1, 1), _image, false);
        endPass();
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

    void IntroState::onJoyPress(Uint8 button, bool down) {
        if(down) {
            invokeTransition<MenuState>();
        }
    }

}
