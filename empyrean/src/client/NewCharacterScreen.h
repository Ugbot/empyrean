#ifndef PYR_NEW_CHARACTER_SCREEN_H
#define PYR_NEW_CHARACTER_SCREEN_H


#include "MenuScreen.h"
#include "MenuState.h"


namespace pyr {

    class NewCharacterScreen : public MenuScreen {
    public:
        NewCharacterScreen(MenuState* state)
            : MenuScreen(state) 
        {
            _name = new phui::TextField("character");
            _name->setPositionAndSize(0, 0, 1024, 384);

            phui::ButtonPtr create = new phui::Button("Create");
            create->addListener(this, &NewCharacterScreen::onCreate);
            create->setPositionAndSize(0, 384, 512, 384);

            phui::ButtonPtr cancel = new phui::Button("Cancel");
            cancel->addListener(this, &NewCharacterScreen::onCancel);
            cancel->setPositionAndSize(512, 384, 512, 384);

            add(_name);
            add(create);
            add(cancel);
        }

    private:
        void onCreate(const phui::ActionEvent&) {
            getState()->onNewCharacterCreate(_name->getText());
        }

        void onCancel(const phui::ActionEvent&) {
            getState()->onNewCharacterCancel();
        }

        phui::TextFieldPtr _name;
    };

}


#endif
