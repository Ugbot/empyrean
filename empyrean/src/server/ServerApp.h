#ifndef PYR_SERVER_APP_H
#define PYR_SERVER_APP_H


#include <string>
#include "ScopedPtr.h"
#include "wx.h"


namespace pyr {

    class LogEvent;
    class ServerFrame;
    class Thread;

    /// Main application class for server.
    class ServerApp : public wxApp {
    public:
        ServerApp();

        bool OnInit();
        int OnExit();

        void log(const std::string& s);

        bool isRunning();
        void start();
        void stop();

    private:
        std::string getDatabaseFilename();

        ServerFrame* _frame;
        ScopedPtr<Thread> _serverThread;
    };

}


DECLARE_APP(pyr::ServerApp)


#endif
