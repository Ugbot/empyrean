#include "Error.h"
#include "Server.h"
#include "ServerFrame.h"
#include "ServerThread.h"


namespace pyr {

    Server::Server() {
        // Give the UI thread high priority.
        PR_SetThreadPriority(PR_GetCurrentThread(), PR_PRIORITY_HIGH);
    
        _frame = 0;
        _serverThread = 0;
    }

    bool Server::OnInit() {
        PYR_BEGIN_EXCEPTION_TRAP()
        
            wxInitAllImageHandlers();

            _frame = new ServerFrame();
            _frame->Show(true);

            log("Welcome to Empyrean!");
            return true;
        
        PYR_END_EXCEPTION_TRAP()
        return false;
    }

    void Server::log(const std::string& s) {
        if (_frame) {
            _frame->log(s);
        }
    }
    
    bool Server::isRunning() {
        return _serverThread;
    }
    
    void Server::start() {
        _serverThread = new Thread(new ServerThread());
    }
    
    void Server::stop() {
        _serverThread = 0;
    }

}
