#ifndef PYR_MAIN_SCREEN_H
#define PYR_MAIN_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"
#include "Texture.h"


namespace pyr {

    class MainScreen : public MenuScreen {
    public:
        MainScreen(MenuState* state)
            : MenuScreen(state)
        {
            _background = Texture::create("images/title/title_main.png");
        
            phui::ButtonPtr connect = new phui::Button("Connect to Server");
            connect->addListener(this, &MainScreen::onConnect);
            connect->setPositionAndSize(0, 384, 1024, 128);
            
            phui::ButtonPtr options = new phui::Button("Options");
            options->addListener(this, &MainScreen::onOptions);
            options->setPositionAndSize(0, 384 + 128, 1024, 128);
            
            phui::ButtonPtr quit = new phui::Button("Quit");
            quit->addListener(this, &MainScreen::onQuit);
            quit->setPositionAndSize(0, 384 + 256, 1024, 128);

            add(connect);
            add(options);
            add(quit);
        }
        
    private:
        void onConnect(const phui::ActionEvent&) {
            getState()->onMainConnect();
        }
        
        void onOptions(const phui::ActionEvent&) {
            getState()->onMainOptions();
        }
        
        void onQuit(const phui::ActionEvent&) {
            getState()->onMainQuit();
        }
        
        Texture* _background;
    };
    
}


#endif
