#include "ConnectingWindow.h"
#include "ServerConnection.h"


namespace pyr {

    ConnectingWindow::ConnectingWindow() {
        using namespace phui;

        setTitle("Connecting...");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(400, 150);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &ConnectingWindow::onCancel);

        add(new Label("Connecting..."));
        add(cancel);
    }

    void ConnectingWindow::update(float dt) {
        ServerConnection& sc = the<ServerConnection>();
        if (sc.isConnected()) {
            endModal();
        } else if (sc.getStatus() == ServerConnection::DISCONNECTED) {
            setModal(new phui::MessageBox("Connection Error", "Error connecting to server"), this);
        }
    }
    
    void ConnectingWindow::onCancel(const phui::ActionEvent&) {
        the<ServerConnection>().disconnect();
        endModal();
    }

    void ConnectingWindow::onEndModal(Widget* widget, int result) {
        endModal();
    }

}
