#include "Error.h"
#include "Log.h"
#include "LogEvent.h"
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

            logMessage("Welcome to Empyrean!");
            return true;
        
        PYR_END_EXCEPTION_TRAP()
        return false;
    }
    
    void Server::log(const std::string& s) {
        if (_frame) {
            // Use the wxWindows event system so logging can be used from
            // multiple threads.
            LogEvent evt(s);
            _frame->AddPendingEvent(evt);
        }
    }

    bool Server::isRunning() {
        if (_serverThread) {
            if (_serverThread->isRunning()) {
                return true;
            } else {
                _serverThread = 0;
                return false;
            }
         } else {
            return false;
        }
    }
    
    void Server::start() {
        _serverThread = new Thread(new ServerThread());
    }
    
    void Server::stop() {
        _serverThread = 0;
    }
    
}
