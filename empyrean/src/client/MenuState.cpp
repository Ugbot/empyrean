#include <phui/SDLBridge.h>
#include "GameState.h"
#include "MenuState.h"
#include "OptionsState.h"
#include "Texture.h"


namespace pyr {

    MenuState::MenuState() 
        /*
        : main("images/title/title_main.png")
        , bg1 ("images/title/title_bg1.png")
        , bg2 ("images/title/title_bg2.png")
        , sky ("images/title/title_sky.png")
        , _connect("images/ui/multiplayer_up.png")
        , _options("images/ui/options_up.png")
        , _exit("images/ui/quit_up.png")
        */        
    {
        createInterface();
        showPointer();
    }
    
    void MenuState::draw(float fade) {
        glDisable(GL_DEPTH_TEST);
        glDisable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glColor4f(0, 0, 0, 1 - fade);
        glBegin(GL_TRIANGLE_FAN);
        glVertex2f(0, 0);
        glVertex2f(0, 1);
        glVertex2f(1, 1);
        glVertex2f(1, 0);
        glEnd();
        
        //sky.draw(0, 0);
        //bg2.draw(0, 0);
        //bg1.draw(679, 314);
        //main.draw(0, 0);
        //_connect.draw(396,332);
        //_options.draw(396,396);
        //_exit.draw(396,460);
        
        glDisable(GL_TEXTURE_2D);
        _root->draw();
        
        glEnable(GL_TEXTURE_2D);
    }
    
    void MenuState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            _root->onKeyDown(phui::SDLToPhuiKey(key));
        } else {
            _root->onKeyUp(phui::SDLToPhuiKey(key));
        }
    }
    
    void MenuState::onMousePress(Uint8 button, bool down, int x, int y) {
        const phui::Point p(x, y);
        if (down) {
            _root->onMouseDown(phui::SDLToPhuiButton(button), p);
        } else {
            _root->onMouseUp(phui::SDLToPhuiButton(button), p);
        }
    }
    
    void MenuState::onMouseMove(int x, int y) {
        _root->onMouseMove(phui::Point(x, y));
    }
    
    void MenuState::createInterface() {
        _connect = new phui::Button("Connect to Server");
        _connect->setPositionAndSize(0, 0, 1024, 256);
        _connect->addMethodListener(this, &MenuState::onButtonPressed);
        
        _options = new phui::Button("Options");
        _options->setPositionAndSize(0, 256, 1024, 256);
        _options->addMethodListener(this, &MenuState::onButtonPressed);
        
        _quit = new phui::Button("Quit");
        _quit->setPositionAndSize(0, 512, 1024, 256);
        _quit->addMethodListener(this, &MenuState::onButtonPressed);

        _root = new phui::RootWidget(
            Application::instance().getWidth(),
            Application::instance().getHeight());
        _root->add(_connect.get());
        _root->add(_options.get());
        _root->add(_quit.get());
    }
    
    void MenuState::onButtonPressed(const phui::ActionEvent& e) {
        if (e.getSource() == _connect) {
            //invokeTransition<ConnectToServerState>();
            invokeTimedTransition<GameState>(1);
        } else if (e.getSource() == _options) {
            invokeTransition<OptionsState>();
        } else if (e.getSource() == _quit) {
            quit();
        }
    }

}
