#include "Configuration.h"
#include "LoggingInWindow.h"
#include "LoginWindow.h"
#include "ServerConnection.h"


namespace pyr {

    LoginWindow::LoginWindow() {
        using namespace phui;

        _username = new TextField(the<Configuration>().username);
        _password = new TextField;

        PanelPtr userPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        userPanel->add(new Label("Username"));
        userPanel->add(_username);

        PanelPtr passPanel = new Panel(new BoxLayout(BoxLayout::HORIZONTAL));
        passPanel->add(new Label("Password"));
        passPanel->add(_password);

        
        ButtonPtr login = new Button("Login");
        login->addListener(this, &LoginWindow::onLogin);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &LoginWindow::onCancel);

        _newUser = new CheckBox("New User");

        PanelPtr buttonPanel = new Panel(
            new BoxLayout(BoxLayout::HORIZONTAL));
        buttonPanel->add(login);
        buttonPanel->add(cancel);

        setTitle("Login");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(424, 300);

        add(userPanel);
        add(passPanel);
        add(_newUser);
        add(buttonPanel);
    }

    void LoginWindow::onLogin(const phui::ActionEvent&) {
        the<ServerConnection>().login(
            _username->getText(),
            _password->getText(),
            _newUser->isChecked());

        setModal(new LoggingInWindow, this);
    }

    void LoginWindow::onCancel(const phui::ActionEvent&) {
        the<ServerConnection>().disconnect();
        endModal();
    }

    void LoginWindow::onEndModal(Widget* widget, int result) {
        ServerConnection& sc = the<ServerConnection>();
        if (sc.getStatus() == ServerConnection::LOGGED_IN) {
            endModal();
        } else if (!sc.isConnected()) {
            endModal();
        }
    }

}
