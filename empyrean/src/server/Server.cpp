#include "Server.h"
#include "ServerFrame.h"


namespace pyr {

    Server::Server() {
        _frame = 0;
    }

    bool Server::OnInit() {
        wxInitAllImageHandlers();

        _frame = new ServerFrame();
        _frame->Show(true);

        log("Welcome to Empyrean");

        return true;
    }

    void Server::log(const std::string& s) {
        if (_frame) {
            _frame->log(s);
        }
    }

}
