#include "Configuration.h"
#include "Database.h"
#include "Error.h"
#include "Log.h"
#include "LogEvent.h"
#include "Server.h"
#include "ServerFrame.h"
#include "ServerThread.h"


#if defined(WIN32)

    #include <windows.h>

    inline void setStartDirectory() {
        // set the current path to where the executable resides
        char filename[MAX_PATH];
        GetModuleFileName(GetModuleHandle(0), filename, MAX_PATH);

        // remove the basename
        char* backslash = strrchr(filename, '\\');
        if (backslash) {
            *backslash = 0;
            SetCurrentDirectory(filename);
        }
    }
    
#else

    inline void setStartDirectory() {
    }
    
#endif


namespace pyr {

    Server::Server() {
        // Give the UI thread high priority so the world update thread
        // and connections don't starve it.
        PR_SetThreadPriority(PR_GetCurrentThread(), PR_PRIORITY_HIGH);
    
        _frame = 0;
        _serverThread = 0;
    }

    bool Server::OnInit() {
        PYR_BEGIN_EXCEPTION_TRAP()
        
            setStartDirectory();
            try {
                the<Configuration>().load();
            }
            catch (const ConfigurationError& /*error*/) {
                // show a warning or something
            }
        
            wxInitAllImageHandlers();
            
            _frame = new ServerFrame();
            _frame->Show(true);

            logMessage("Welcome to Empyrean!");

            try {
                the<Database>().load(getDatabaseFilename());
            }
            catch (const DatabaseError& e) {
                logMessage(std::string("Error loading database: ") + e.what());
            }

            if (the<Configuration>().shouldStartServer) {
                start();
            }

            return true;
        
        PYR_END_EXCEPTION_TRAP()
        return false;
    }
    
    int Server::OnExit() {
        PYR_BEGIN_EXCEPTION_TRAP()
            setStartDirectory();
            _frame = 0;
            the<Database>().save(getDatabaseFilename());
            the<Configuration>().save();
        PYR_END_EXCEPTION_TRAP()
        return 0;
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
        logMessage("Starting...");
        _serverThread = new Thread(new ServerThread());
        logMessage("Started");
    }
    
    void Server::stop() {
        logMessage("Stopping...");
        _serverThread = 0;
        logMessage("Stopped");
    }
    
    std::string Server::getDatabaseFilename() {
        return "database.xml";
    }
    
}
