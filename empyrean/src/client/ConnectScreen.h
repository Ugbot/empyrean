#ifndef PYR_CONNECT_SCREEN_H
#define PYR_CONNECT_SCREEN_H


#include "Configuration.h"
#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class ConnectScreen : public MenuScreen {
    public:
        ConnectScreen(MenuState* state)
            : MenuScreen(state)
        {
            std::string server = Configuration::instance().getServer();
            std::string port = itos(Configuration::instance().getPort());

            _server = new phui::TextField(server + ":" + port);
            _server->setPositionAndSize(0, 0, 1024, 256);
            
            phui::ButtonPtr connect = new phui::Button("Connect");
            connect->addListener(this, &ConnectScreen::onConnect);
            connect->setPositionAndSize(0, 256, 1024, 256);

            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->addListener(this, &ConnectScreen::onCancel);
            cancel->setPositionAndSize(0, 512, 1024, 256);
            
            add(_server);
            add(connect);
            add(cancel);
        }

    private:
        void onConnect(const phui::ActionEvent&) {
            std::vector<std::string> splits = splitString(
                _server->getText(), ":");
                            
            std::string server = Configuration::instance().getServer();
            int port           = Configuration::instance().getPort();
            if (splits.size() > 0) {
                server = splits[0];
                if (splits.size() > 1) {
                    port = atoi(splits[1].c_str());
                }
            }
            
            getState()->onConnectConnect(server, port);
        }
        
        void onCancel(const phui::ActionEvent&) {
            getState()->onConnectCancel();
        }
    
        phui::TextFieldPtr _server;
    };
    
}


#endif
