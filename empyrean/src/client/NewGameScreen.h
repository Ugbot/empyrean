#ifndef PYR_NEW_GAME_SCREEN_H
#define PYR_NEW_GAME_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class NewGameScreen : public MenuScreen {
    public:
        NewGameScreen(MenuState* state)
            : MenuScreen(state) 
        {
            _name = new phui::TextField();
            _name->setPositionAndSize(0, 0, 1024, 256);

            _password = new phui::TextField();
            _password->setPositionAndSize(0, 256, 1024, 256);
            
            phui::ButtonPtr create = new phui::Button("Create");
            create->addListener(this, &NewGameScreen::onCreate);
            create->setPositionAndSize(0, 512, 512, 256);

            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->addListener(this, &NewGameScreen::onCancel);
            cancel->setPositionAndSize(512, 512, 512, 256);

            add(_name);
            add(_password);
            add(create);
            add(cancel);
        }

    private:
        void onCreate(const phui::ActionEvent&) {
            getState()->onNewGameCreate(
                _name->getText(), _password->getText());
        }

        void onCancel(const phui::ActionEvent&) {
            getState()->onNewGameCancel();
        }

        phui::TextFieldPtr _name;
        phui::TextFieldPtr _password;
    };

}


#endif
