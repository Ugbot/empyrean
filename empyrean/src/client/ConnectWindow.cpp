#include "Configuration.h"
#include "ConnectWindow.h"
#include "ConnectingWindow.h"
#include "Constants.h"
#include "LoginWindow.h"
#include "ServerConnection.h"


namespace pyr {

    ConnectWindow::ConnectWindow() {
        using namespace phui;

        _server = new TextField(the<Configuration>().server);

        PanelPtr serverPanel = new Panel(
            new BoxLayout(BoxLayout::HORIZONTAL));
        serverPanel->add(new Label("Server"));
        serverPanel->add(_server);


        ButtonPtr connect = new Button("Connect");
        connect->addListener(this, &ConnectWindow::onConnect);

        ButtonPtr cancel  = new Button("Cancel");
        cancel->addListener(this, &ConnectWindow::onCancel);

        PanelPtr buttonPanel = new Panel(
            new BoxLayout(BoxLayout::HORIZONTAL));
        buttonPanel->add(connect);
        buttonPanel->add(cancel);


        setTitle("Connect to Server");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(424, 160);

        add(serverPanel);
        add(buttonPanel);
    }

    void ConnectWindow::onConnect(const phui::ActionEvent&) {
        std::vector<std::string> splits = splitString(_server->getText(), ":");

        if (splits.empty()) {
            // show message box
            return;
        }

        int port = constants::SERVER_PORT;
        std::string server = splits[0];
        if (splits.size() > 1) {
            port = atoi(splits[1].c_str());
        }

        the<Configuration>().server = _server->getText();

        the<ServerConnection>().beginConnecting(server, port);
        setModal(new ConnectingWindow, this);
    }

    void ConnectWindow::onCancel(const phui::ActionEvent&) {
        endModal();
    }

    void ConnectWindow::onEndModal(Widget* widget, int result) {
        ServerConnection& sc = the<ServerConnection>();
        switch (sc.getStatus()) {
            case ServerConnection::CONNECTED:
                setModal(new LoginWindow, this);
                break;

            case ServerConnection::LOGGED_IN:
                endModal();
                break;

            default: // stupid GCC
                break;
        }
    }

}
