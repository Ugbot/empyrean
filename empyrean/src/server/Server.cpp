#include "Server.h"
#include "ServerFrame.h"


namespace pyr {

    bool Server::OnInit() {
        ServerFrame* frame = new ServerFrame();
        frame->Show(true);
        return true;
    }

}
