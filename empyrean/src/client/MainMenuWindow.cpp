#include "ConnectWindow.h"
#include "LobbyState.h"
#include "MainMenuWindow.h"
#include "MenuState.h"
#include "ServerConnection.h"


namespace pyr {

    MainMenuWindow::MainMenuWindow(MenuState* state) {
        using namespace phui;

        _state = state;

        setTitle("Empyrean");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setPositionAndSize(400, 320, 224, 280);

        ButtonPtr connect = new Button("Connect to Server");
        connect->addListener(this, &MainMenuWindow::onConnectToServer);

        ButtonPtr options = new Button("Options");
        options->addListener(this, &MainMenuWindow::onOptions);
        options->setForegroundColor(Color(0.5f, 0.5f, 0.5f));
        options->disable();

        ButtonPtr credits = new Button("Credits");
        credits->addListener(this, &MainMenuWindow::onCredits);
        credits->setForegroundColor(Color(0.5f, 0.5f, 0.5f));
        credits->disable();

        ButtonPtr quit = new Button("Quit");
        quit->addListener(this, &MainMenuWindow::onQuit);

        add(connect);
        add(options);
        add(credits);
        add(quit);
    }

    void MainMenuWindow::onConnectToServer(const phui::ActionEvent&) {
        setModal(new ConnectWindow, this);
    }

    void MainMenuWindow::onOptions(const phui::ActionEvent&) {
        _state->onOptions();
    }

    void MainMenuWindow::onCredits(const phui::ActionEvent&) {
        _state->onCredits();
    }

    void MainMenuWindow::onQuit(const phui::ActionEvent&) {
        _state->onQuit();
    }

    void MainMenuWindow::onEndModal(Widget* widget, int result) {
        ServerConnection& sc = the<ServerConnection>();
        if (sc.getStatus() == ServerConnection::LOGGED_IN) {
            _state->onLoggedIn();
        }
    }

}
