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
            createMainScreen();
            createConnectWindow();
        }
        
    private:
        void createMainScreen() {
            phui::PicturePtr background = new phui::Picture("images/title/title_composite.png");
            background->setPositionAndSize(0, 0, 1024, 768);
            
            phui::WindowPtr buttons = new phui::Window(
                "Empyrean",
                new phui::BoxLayout(phui::BoxLayout::VERTICAL));
            buttons->setPositionAndSize(400, 350, 224, 240);
            buttons->show();
        
            phui::ButtonPtr connect = new phui::Button("Connect to Server");
            connect->addListener(this, MainScreen::onConnectToServer);
            
            phui::ButtonPtr options = new phui::Button("Options");
            options->addListener(this, MainScreen::onOptions);
            
            phui::ButtonPtr quit = new phui::Button("Quit");
            quit->addListener(this, MainScreen::onQuit);

            add(background);
            buttons->add(connect);
            buttons->add(options);
            buttons->add(quit);
            add(buttons);
        }
        
        void createConnectWindow() {
            phui::ButtonPtr connect = new phui::Button("Connect");
            connect->addListener(this, MainScreen::onConnect);
            
            phui::ButtonPtr cancel  = new phui::Button("Cancel");
            cancel->addListener(this, MainScreen::onCancel);
        
            _connectWindow = new phui::Window(
                "Connect to Server",
                new phui::BoxLayout(phui::BoxLayout::VERTICAL));
            _connectWindow->show();
            _connectWindow->setPositionAndSize(300, 250, 424, 440);
            _connectWindow->add(connect);
            _connectWindow->add(cancel);
        }
    
        void onConnectToServer(const phui::ActionEvent&) {
            setModal(_connectWindow);
        }
        
        void onOptions(const phui::ActionEvent&) {
            getState()->onMainOptions();
        }
        
        void onQuit(const phui::ActionEvent&) {
            getState()->onMainQuit();
        }
        
        void onConnect(const phui::ActionEvent&) {
            endModal();
            getState()->onMainConnect();
        }
        
        void onCancel(const phui::ActionEvent&) {
            endModal();
        }
        
        phui::WindowPtr _connectWindow;
    };
    
}


#endif
