#ifndef PYR_ERROR_SCREEN_H
#define PYR_ERROR_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class ErrorScreen : public MenuScreen {
    public:
        ErrorScreen(MenuState* state, const std::string& error)
            : MenuScreen(state)
        {
            phui::LabelPtr label = new phui::Label(error);
            label->setPositionAndSize(0, 0, 1024, 384);
            
            phui::ButtonPtr button = new phui::Button("OK");
            button->setPositionAndSize(0, 384, 1024, 384);
            button->addListener(this, &ErrorScreen::onOK);
            
            add(label);
            add(button);
        }
        
    private:
        void onOK(const phui::ActionEvent&) {
            getState()->onErrorOK();
        }
    };

}


#endif
