#ifndef PYR_LOBBY_STATE_H
#define PYR_LOBBY_STATE_H


#include <phui/phui.h>
#include "UIState.h"


namespace pyr {

    class LobbyState : public UIState, public phui::ModalListener {
    public:
        LobbyState();

	const char* getName() const {
            return "LobbyState";
	}

        void update(float dt);
        
        // screen callbacks below

        void onJoinGame(const phui::ActionEvent&);
        void onNewGame(const phui::ActionEvent&);
        void onQuit(const phui::ActionEvent&);
        void onSay(const phui::ActionEvent&);

    private:
        void setModal(phui::Widget* widget);
        void onEndModal(phui::Widget* widget, int result);

        phui::WidgetPtr _background;
        phui::TextFieldPtr _text;
        phui::ListBoxPtr _messages;
    };

}


#endif
