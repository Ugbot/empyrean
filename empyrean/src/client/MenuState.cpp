#include <phui/SDLBridge.h>
#include "MainMenuWindow.h"
#include "MenuState.h"
#include "ServerConnection.h"
#include "Texture.h"


namespace pyr {

    class CreditsState;
    class LobbyState;

    MenuState::MenuState() {
        showPointer();

        phui::PicturePtr background = new phui::Picture("images/title/title_composite.tga");
        background->setPositionAndSize(0, 0, 1024, 768);
        background->add(new MainMenuWindow(this));
        
        getRoot()->add(background);
    }

    void MenuState::update(float dt) {
        UIState::update(dt);
        ServerConnection::instance().update();
    }

    void MenuState::onOptions() {
        // invokeTransition<OptionsState>();
    }

    void MenuState::onCredits() {
        invokeTransition<CreditsState>();
    }

    void MenuState::onQuit() {
        quit();
    }

    void MenuState::onLoggedIn() {
        invokeTransition<LobbyState>();
    }

}
