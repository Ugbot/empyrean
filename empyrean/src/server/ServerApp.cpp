#include "Configuration.h"
#include "Database.h"
#include "Error.h"
#include "ServerLog.h"
#include "LogEvent.h"
#include "Platform.h"
#include "ServerApp.h"
#include "ServerFrame.h"
#include "ServerThread.h"
#include "Log.h"


namespace pyr {

    ServerApp::ServerApp() {
        // Give the UI thread high priority so the world update thread
        // and connections don't starve it.
        PR_SetThreadPriority(PR_GetCurrentThread(), PR_PRIORITY_HIGH);
    
        _frame = 0;
        _serverThread = 0;
    }

    bool ServerApp::OnInit() {
        PYR_BEGIN_EXCEPTION_TRAP()
        
            // Prepare the log file
            the<Log>().open(getStartDirectory(argc, argv) + "/server.log");
        
            setStartDirectory(argc, argv);
            try {
                the<Configuration>().load();
            }
            catch (const ConfigurationError& /*error*/) {
                // show a warning or something
            }

            wxInitAllImageHandlers();
            
            _frame = new ServerFrame();
            _frame->Show(true);

            PYR_SERVER_LOG() << "Welcome to Empyrean!";

            try {
                the<Database>().load(getDatabaseFilename());
            }
            catch (const DatabaseError& e) {
                PYR_SERVER_LOG() << "Warning, could not load database: " << e.what();
                PYR_SERVER_LOG() << "Creating empty one.";
            }

            if (the<Configuration>().shouldStartServer) {
                start();
            }

            return true;
        
        PYR_END_EXCEPTION_TRAP()
        return false;
    }
    
    int ServerApp::OnExit() {
        PYR_BEGIN_EXCEPTION_TRAP()
            setStartDirectory(argc, argv);
            _frame = 0;
            the<Database>().save(getDatabaseFilename());
            the<Configuration>().save();
        PYR_END_EXCEPTION_TRAP()
        return 0;
    }
    
    void ServerApp::log(const std::string& s) {
        if (_frame) {
            // Use the wxWindows event system so logging can be used from
            // multiple threads.
            LogEvent evt(s);
            _frame->AddPendingEvent(evt);
        }
    }

    bool ServerApp::isRunning() {
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
    
    void ServerApp::start() {
        PYR_SERVER_LOG() << "Starting...";
        _serverThread = new Thread(new ServerThread());
        PYR_SERVER_LOG() << "Started";
    }
    
    void ServerApp::stop() {
        PYR_SERVER_LOG() << "Stopping...";
        _serverThread = 0;
        PYR_SERVER_LOG() << "Stopped";
    }
    
    std::string ServerApp::getDatabaseFilename() {
        return "database.xml";
    }
    
}
