#include "LoggingInWindow.h"
#include "ServerConnection.h"

namespace pyr {

    LoggingInWindow::LoggingInWindow() {
        using namespace phui;

        setTitle("Logging In...");
        setLayout(new BoxLayout(BoxLayout::VERTICAL));
        setSize(400, 150);

        ButtonPtr cancel = new Button("Cancel");
        cancel->addListener(this, &LoggingInWindow::onCancel);
            
        add(new phui::Label("Logging in..."));
        add(cancel);
    }
        
    void LoggingInWindow::update(float /*dt*/) {
        ServerConnection& sc = ServerConnection::instance();
        if (sc.getStatus() == ServerConnection::LOGGED_IN) {
            endModal();
        } else if (sc.loginFailed()) {
            setModal(new phui::MessageBox("Log Into Server", "Error logging in: " + sc.getError()), this);
        }
    }

    void LoggingInWindow::onCancel(const phui::ActionEvent&) {
        endModal();
    }

    void LoggingInWindow::onEndModal(Widget* widget, int result) {
        endModal();
    }
}
