#include "JoinGameWindow.h"
#include "JoiningGameWindow.h"
#include "ServerConnection.h"


namespace pyr {

    JoinGameWindow::JoinGameWindow() {
        using namespace phui;

        _game = new TextField("game");
        _password = new TextField;

        PanelPtr gamePanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        gamePanel->add(new Label("Game"));
        gamePanel->add(_game);

        PanelPtr passPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        passPanel->add(new Label("Password"));
        passPanel->add(_password);

        ButtonPtr join = new Button("Join");
        join->addListener(this, &JoinGameWindow::onJoin);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &JoinGameWindow::onCancel);

        PanelPtr buttonPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        buttonPanel->add(join);
        buttonPanel->add(cancel);

        setTitle("Join Game");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(424, 240);

        add(gamePanel);
        add(passPanel);
        add(buttonPanel);
    }

    void JoinGameWindow::onJoin(const phui::ActionEvent&) {
        ServerConnection::instance().joinGame(
            _game->getText(),
            _password->getText(),
            false);

        setModal(new JoiningGameWindow, this);
    }

    void JoinGameWindow::onCancel(const phui::ActionEvent&) {
        endModal();
    }

    void JoinGameWindow::onEndModal(Widget* widget, int result) {
        // If successfully joined game...
        if (result) {
            endModal(result);
        }
    }

}
