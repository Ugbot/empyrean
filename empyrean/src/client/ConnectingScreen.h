#ifndef PYR_CONNECTING_SCREEN_H
#define PYR_CONNECTING_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"
#include "ServerConnection.h"


namespace pyr {

    class ConnectingScreen : public MenuScreen {
    public:
        ConnectingScreen(MenuState* state)
            : MenuScreen(state)
        {
            phui::LabelPtr status = new phui::Label("Connecting...");
            status->setPositionAndSize(0, 0, 1024, 384);
            
            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->setPositionAndSize(0, 384, 1024, 384);
            cancel->addListener(this, &ConnectingScreen::onCancel);
            
            add(status);
            add(cancel);
        }
        
        void update(float dt) {
            MenuScreen::update(dt);
            switch (ServerConnection::instance().getStatus()) {
                case ServerConnection::CONNECTING: {
                    // keep showing the message...
                    break;
                }
            
                case ServerConnection::CONNECTED: {
                    getState()->onConnectingConnected();
                    break;
                }
                    
                case ServerConnection::DISCONNECTED: {
                    std::string error = ServerConnection::instance().getError();
                    getState()->onConnectingError("Connection failed: " + error);
                    break;
                }
                
                default: {
                    getState()->onConnectingError("Unknown connecting error");
                    break;
                }
            }
        }
            
    private:
        void onCancel(const phui::ActionEvent&) {
            getState()->onConnectingCancel();
        }
    };
    
}


#endif
