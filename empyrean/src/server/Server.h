#ifndef PYR_SERVER_H
#define PYR_SERVER_H


#include <string>
#include "ScopedPtr.h"
#include "wx.h"


namespace pyr {

    class LogEvent;
    class ServerFrame;
    class Thread;

    class Server : public wxApp {
    public:
        Server();

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


DECLARE_APP(pyr::Server)


#endif
