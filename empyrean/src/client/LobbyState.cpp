#include "JoinGameWindow.h"
#include "LobbyState.h"
#include "NewGameWindow.h"
#include "ServerConnection.h"


namespace pyr {

    class CutSceneState;
    class MenuState;

    LobbyState::LobbyState() {
        showPointer();

        _background = new phui::Picture("images/backdrop.jpg");
        _background->setPositionAndSize(0, 0, 1024, 768);

        phui::ButtonPtr joinGame = new phui::Button("Join Game");
        joinGame->addListener(this, &LobbyState::onJoinGame);
        joinGame->setPositionAndSize(0, 0, 100, 100);

        phui::ButtonPtr newGame = new phui::Button("New Game");
        newGame->addListener(this, &LobbyState::onNewGame);
        newGame->setPositionAndSize(0, 100, 100, 100);

        phui::ButtonPtr leave = new phui::Button("Leave Server");
        leave->addListener(this, &LobbyState::onQuit);
        leave->setPositionAndSize(0, 200, 100, 100);

        _messages = new phui::ListBox();
        _messages->setPositionAndSize(100, 0, 924, 668);
        _messages->setBackgroundColor(phui::Color(0, 0, 0, 0.5f));

        _text = new phui::TextField();
        _text->setPositionAndSize(100, 668, 724, 100);

        phui::ButtonPtr say = new phui::Button("Say");
        say->addListener(this, &LobbyState::onSay);
        say->setPositionAndSize(824, 668, 200, 100);

        _background->add(joinGame);
        _background->add(newGame);
        _background->add(leave);
        _background->add(_messages);
        _background->add(_text);
        _background->add(say);

        getRoot()->add(_background);
    }

    void LobbyState::update(float dt) {
        UIState::update(dt);

        ServerConnection& sc = the<ServerConnection>();
        if (!sc.isConnected()) {
            // Show error message and quit.
        }

        std::vector<std::string> msgs = sc.getLobbyMessages();
        _messages->add(msgs);
    }

    void LobbyState::onJoinGame(const phui::ActionEvent&) {
        setModal(new JoinGameWindow);
    }

    void LobbyState::onNewGame(const phui::ActionEvent&) {
        setModal(new NewGameWindow);
    }

    void LobbyState::onQuit(const phui::ActionEvent&) {
        the<ServerConnection>().disconnect();
        invokeTransition<MenuState>();
    }

    void LobbyState::onSay(const phui::ActionEvent&) {
        the<ServerConnection>().say(_text->getText());
        _text->setText("");
    }

    void LobbyState::setModal(phui::Widget* widget) {
        _background->setModal(widget, this);
    }

    void LobbyState::onEndModal(phui::Widget* widget, int result) {
        if (result) {
            invokeTransition<CutSceneState>();
        }
    }

}
