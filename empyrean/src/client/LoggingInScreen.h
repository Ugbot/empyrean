#ifndef PYR_LOGGING_IN_SCREEN_H
#define PYR_LOGGING_IN_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class LoggingInScreen : public MenuScreen {
    public:
        LoggingInScreen(MenuState* state)
            : MenuScreen(state)
        {
            phui::LabelPtr label = new phui::Label("Logging in...");
            label->setPositionAndSize(0, 0, 1024, 384);
        
            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->setPositionAndSize(0, 384, 1024, 384);
            cancel->addListener(this, &LoggingInScreen::onCancel);
            
            add(label);
            add(cancel);
        }
        
        void update(float /*dt*/) {
            ServerConnection& sc = ServerConnection::instance();
            if (sc.getStatus() == ServerConnection::LOGGED_IN) {
                getState()->onLoggingInLoggedIn();
            } else if (sc.loginFailed()) {
                getState()->onLoggingInError(sc.getError());
            }
        }
        
    private:
        void onCancel(const phui::ActionEvent&) {
            getState()->onLoggingInCancel();
        }
    };
    
}


#endif
