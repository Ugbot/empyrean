#ifndef PYR_CREATING_GAME_SCREEN_H
#define PYR_CREATING_GAME_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"
#include "PacketTypes.h"


namespace pyr {

    class JoiningGameScreen : public MenuScreen {
    public:
        JoiningGameScreen(MenuState* state)
            : MenuScreen(state)
        {
            phui::LabelPtr status = new phui::Label("Joining game...");
            status->setPositionAndSize(0, 0, 1024, 384);
            
            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->setPositionAndSize(0, 384, 1024, 384);
            cancel->addListener(this, &JoiningGameScreen::onCancel);
            
            add(status);
            add(cancel);
        }
        
    private:
        void update(float dt) {
            MenuScreen::update(dt);
            ServerConnection& sc = ServerConnection::instance();
            
            if (sc.hasJoinGameResponse()) {
                u16 r = sc.getJoinGameResponse();
                switch (r) {
                    case JGR_JOINED: {
                        getState()->onJoiningGameJoined();
                        break;
                    }
                        
                    case JGR_INVALID_NAME: {
                        getState()->onJoiningGameError("Invalid Name");
                        break;
                    }
                    
                    case JGR_NO_GAME: {
                        getState()->onJoiningGameError("No Game");
                        break;
                    }
                    
                    case JGR_INVALID_PASSWORD: {
                        getState()->onJoiningGameError("Invalid Password");
                        break;
                    }
                    
                    case JGR_ALREADY_STARTED: {
                        getState()->onJoiningGameError("Already Started");
                        break;
                    }
                    
                    default: {
                        getState()->onJoiningGameError("Unknown Join Game error");
                        break;
                    }
                }
            }
        }
    
        void onCancel(const phui::ActionEvent&) {
            getState()->onJoiningGameCancel();
        }
    };

}


#endif
