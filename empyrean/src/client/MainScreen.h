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
            using namespace phui;
    
            PicturePtr background = new Picture("images/title/title_composite.png");
            background->setPositionAndSize(0, 0, 1024, 768);
            
            WindowPtr buttons = new Window(
                "Empyrean",
                new BoxLayout(BoxLayout::VERTICAL));
            buttons->setPositionAndSize(400, 350, 224, 240);
            buttons->show();
        
            ButtonPtr connect = new Button("Connect to Server");
            connect->addListener(this, MainScreen::onConnectToServer);
            
            ButtonPtr options = new Button("Options");
            options->addListener(this, MainScreen::onOptions);
            
            ButtonPtr quit = new Button("Quit");
            quit->addListener(this, MainScreen::onQuit);

            add(background);
            buttons->add(connect);
            buttons->add(options);
            buttons->add(quit);
            add(buttons);
        }
        
        void createConnectWindow() {
            using namespace phui;
        
            std::string server = Configuration::instance().getServer();
            std::string port = itos(Configuration::instance().getPort());
            _server = new TextField(server + ":" + port);
            
            WidgetContainerPtr serverPanel = new WidgetContainer(
                new BoxLayout(BoxLayout::HORIZONTAL));
            serverPanel->add(new Label("Server"));
            serverPanel->add(_server);
                        
            ButtonPtr connect = new Button("Connect");
            connect->addListener(this, MainScreen::onConnect);
            
            ButtonPtr cancel  = new Button("Cancel");
            cancel->addListener(this, MainScreen::onCancel);
        
            _connectWindow = new Window(
                "Connect to Server",
                new BoxLayout(BoxLayout::VERTICAL));
            _connectWindow->show();
            _connectWindow->setPositionAndSize(300, 250, 424, 440);
            _connectWindow->add(serverPanel);
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
            std::vector<std::string> splits = splitString(
                _server->getText(), ":");
                
            if (splits.empty()) {
                // show message box
                return;
            }
                            
            int port = Configuration::instance().getPort();
            std::string server = splits[0];
            if (splits.size() > 1) {
                port = atoi(splits[1].c_str());
            }
            
            endModal();
            getState()->onConnectConnect(server, port);
        }
        
        void onCancel(const phui::ActionEvent&) {
            endModal();
        }
        
        phui::WindowPtr _connectWindow;
        phui::TextFieldPtr _server;
    };
    
}


#endif
