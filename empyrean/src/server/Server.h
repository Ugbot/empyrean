#ifndef PYR_SERVER_H
#define PYR_SERVER_H


#include <string>
#include "Utility.h"
#include "wx.h"


namespace pyr {

    class ServerFrame;
    class Thread;

    class Server : public wxApp {
    public:
        Server();

        bool OnInit();
        
        void log(const std::string& s);
        bool isRunning();
        void start();
        void stop();

    private:
        ServerFrame* _frame;
        ScopedPtr<Thread> _serverThread;
    };

}


DECLARE_APP(pyr::Server)


#endif