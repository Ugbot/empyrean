#ifndef PYR_SERVER_H
#define PYR_SERVER_H


#include <string>
#include "wx.h"


namespace pyr {

    class ServerFrame;

    class Server : public wxApp {
    public:
        Server();

        bool OnInit();
        void log(const std::string& s);

    private:
        ServerFrame* _frame;
    };

}


DECLARE_APP(pyr::Server)


#endif
