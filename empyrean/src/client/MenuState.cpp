#include "GameState.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    MenuState::MenuState() 
        : main("images/title/title_main.png")
        , bg1 ("images/title/title_bg1.png")
        , bg2 ("images/title/title_bg2.png")
        , sky ("images/title/title_sky.png")
        , connectbutton("images/ui/multiplayer_up.png")
        , optionsbutton("images/ui/options_up.png")
        , exitbutton("images/ui/quit_up.png")
    {
    }
    
    void MenuState::draw(float fade) {
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1024, 768, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(1, 1, 1, 1 - fade);

        sky.draw(0, 0);
        bg2.draw(0, 0);
        bg1.draw(679, 314);
        main.draw(0, 0);
        connectbutton.draw(396,332);
        optionsbutton.draw(396,396);
        exitbutton.draw(396,460);
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        float ny = float(y) / Application::instance().getHeight();
        
        if (ny < 0.33) {
            invokeTimedTransition<GameState>(1);
        } else if (ny < 0.66) {
//            invokeTimedTransition<OptionsState>(1);
        } else {
            quit();
        }
    }

}
