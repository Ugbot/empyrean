#include "JoiningGameWindow.h"
#include "NewGameWindow.h"
#include "ServerConnection.h"


namespace pyr {

    NewGameWindow::NewGameWindow() {
        using namespace phui;

        _game = new TextField("game");
        _password = new TextField;

        PanelPtr gamePanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        gamePanel->add(new Label("Game"));
        gamePanel->add(_game);

        PanelPtr passPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        passPanel->add(new Label("Password"));
        passPanel->add(_password);

        ButtonPtr join = new Button("Create");
        join->addListener(this, &NewGameWindow::onCreate);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &NewGameWindow::onCancel);

        PanelPtr buttonPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        buttonPanel->add(join);
        buttonPanel->add(cancel);

        setTitle("New Game");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(424, 240);

        add(gamePanel);
        add(passPanel);
        add(buttonPanel);
    }

    void NewGameWindow::onCreate(const phui::ActionEvent&) {
        ServerConnection::instance().joinGame(
            _game->getText(),
            _password->getText(),
            true);

        setModal(new JoiningGameWindow, this);
    }

    void NewGameWindow::onCancel(const phui::ActionEvent&) {
        endModal();
    }

    void NewGameWindow::onEndModal(Widget* widget, int result) {
        // If successfully joined game...
        if (result) {
            endModal(result);
        }
    }

}
