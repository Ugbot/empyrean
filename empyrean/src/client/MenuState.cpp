#include "GameState.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    MenuState::MenuState() {
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        _image = new Texture("images/menu.png");
    }
    
    void MenuState::draw(float fade) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(1, 1, 1, 1 - fade);
        _image->drawRectangle(0, 0, 1, 1);
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        float ny = float(y) / Application::instance().getHeight();
        
        if (ny < 0.33) {
            invokeTimedTransition<GameState>(1000);
        } else if (ny < 0.66) {
//            invokeTimedTransition<OptionsState>(1000);
        } else {
            quit();
        }
    }

}
