#ifndef PYR_MAIN_SCREEN_H
#define PYR_MAIN_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class MainScreen : public MenuScreen {
    public:
        MainScreen(MenuState* state)
            : MenuScreen(state)
        {
            phui::ButtonPtr connect = new phui::Button("Connect to Server");
            connect->addListener(this, &MainScreen::onConnect);
            connect->setPositionAndSize(0, 0, 1024, 256);
            
            phui::ButtonPtr options = new phui::Button("Options");
            options->addListener(this, &MainScreen::onOptions);
            options->setPositionAndSize(0, 256, 1024, 256);
            
            phui::ButtonPtr quit = new phui::Button("Quit");
            quit->addListener(this, &MainScreen::onQuit);
            quit->setPositionAndSize(0, 512, 1024, 256);

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
    };
    
}


#endif
