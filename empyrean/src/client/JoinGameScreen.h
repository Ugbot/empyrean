#ifndef PYR_JOIN_GAME_SCREEN_H
#define PYR_JOIN_GAME_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class JoinGameScreen : public MenuScreen {
    public:
        JoinGameScreen(MenuState* state)
            : MenuScreen(state) 
        {
            _name = new phui::TextField("game");
            _name->setPositionAndSize(0, 0, 1024, 256);

            _password = new phui::TextField();
            _password->setPositionAndSize(0, 256, 1024, 256);
            
            phui::ButtonPtr join = new phui::Button("Join");
            join->addListener(this, &JoinGameScreen::onJoin);
            join->setPositionAndSize(0, 512, 512, 256);

            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->addListener(this, &JoinGameScreen::onCancel);
            cancel->setPositionAndSize(512, 512, 512, 256);

            add(_name);
            add(_password);
            add(join);
            add(cancel);
        }

    private:
        void onJoin(const phui::ActionEvent&) {
            getState()->onJoinGameJoin(
                _name->getText(), _password->getText());
        }

        void onCancel(const phui::ActionEvent&) {
            getState()->onJoinGameCancel();
        }

        phui::TextFieldPtr _name;
        phui::TextFieldPtr _password;
    };

}


#endif
