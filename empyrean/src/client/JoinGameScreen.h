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
            phui::PicturePtr background = new phui::Picture("images/backdrop.jpg");
            background->setPositionAndSize(0, 0, 1024, 768);
            
            _name = new phui::TextField("game");
            _name->setPositionAndSize(0, 0, 1024, 256);
            _name->setBackgroundColor(phui::Colorf(0, 0, 0, 0.3f));

            _password = new phui::TextField();
            _password->setPositionAndSize(0, 256, 1024, 256);
            _password->setBackgroundColor(phui::Colorf(0, 0, 0, 0.3f));

            phui::ButtonPtr join = new phui::Button("Join");
            join->addListener(this, &JoinGameScreen::onJoin);
            join->setPositionAndSize(0, 512, 512, 256);
            join->setBackgroundColor(phui::Colorf(0.5f, 0.5f, 0.5f, 0.8f));

            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->addListener(this, &JoinGameScreen::onCancel);
            cancel->setPositionAndSize(512, 512, 512, 256);
            cancel->setBackgroundColor(phui::Colorf(0.5f, 0.5f, 0.5f, 0.8f));

            add(background);
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
