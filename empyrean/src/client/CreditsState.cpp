#include "CreditsState.h"
#include "GLUtility.h"
#include "MenuState.h"
#include "OpenGL.h"


namespace pyr {

    CreditsState::CreditsState() {
        _renderer = gltext::CreateRenderer(
            gltext::TEXTURE,
            gltext::OpenFont("fonts/Vera.ttf", 24));
        if (!_renderer) {
            throw std::runtime_error("Creating font renderer failed");
        }
    }

    void CreditsState::draw(float /*fade*/) {
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        setOrthoProjection(640, 480);
        
        glClear(GL_COLOR_BUFFER_BIT);
        _renderer->render(
            "Lead Programmer:  Chad Austin\n"
            "Programmer:    Andy Friesen\n"
            "Artwork:   Corey Annis\n"
            "Design:    Theo Reed, Bryan Walter, Ian Bollinger");
    }
    
    
    void CreditsState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            invokeTransition<MenuState>();
        }
    }
    
    void CreditsState::onMousePress(Uint8 button, bool down, int x, int y) {
        if (down) {
            invokeTransition<MenuState>();
        }
    }

}
