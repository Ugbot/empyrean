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
            phui::PicturePtr background = new phui::Picture("images/title/title_composite.png");
            background->setPositionAndSize(0, 0, 1024, 768);
            
            phui::WindowPtr buttons = new phui::Window();
            buttons->setPositionAndSize(400, 350, 224, 240);
            buttons->show();
        
            phui::ButtonPtr connect = new phui::Button("Connect to Server");
            connect->addListener(this, &MainScreen::onConnect);
            connect->setPositionAndSize(0, 0, 224, 80);
            
            phui::ButtonPtr options = new phui::Button("Options");
            options->addListener(this, &MainScreen::onOptions);
            options->setPositionAndSize(0, 84, 224, 80);
            
            phui::ButtonPtr quit = new phui::Button("Quit");
            quit->addListener(this, &MainScreen::onQuit);
            quit->setPositionAndSize(0, 168, 224, 80);

            add(background);
            buttons->add(connect);
            buttons->add(options);
            buttons->add(quit);
            add(buttons);
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
    };
    
}


#endif
