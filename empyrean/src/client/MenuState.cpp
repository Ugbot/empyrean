#include "GameState.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    MenuState::MenuState() 
        : main("images/title/title_main.png")
        , bg1 ("images/title/title_bg1.png")
        , bg2 ("images/title/title_bg2.png")
        , sky ("images/title/title_sky.png")
        //, buttons("images/menu_items.png")
        //, _connect(buttons.getImage(1, 87, 233, 43))
    {
/*        _tex1 = Texture::create("images/title/title_main.png");
        _tex2 = Texture::create("images/title/title_bg1.png");
        _tex3 = Texture::create("images/title/title_bg2.png");
        _tex4 = Texture::create("images/title/title_sky.png");*/
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
        //_connect->draw(100,100);
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
