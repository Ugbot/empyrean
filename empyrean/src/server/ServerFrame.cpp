#include "ServerFrame.h"


namespace pyr {

    enum {
        ID_SERVER_START = wxID_HIGHEST,
        ID_SERVER_STOP,
    };

    BEGIN_EVENT_TABLE(ServerFrame, wxFrame)
    END_EVENT_TABLE()
    
    ServerFrame::ServerFrame()
        : wxFrame(0, -1, "Empyrean Server")
    {
        createMenu();
        createContents();
    }
    
    void ServerFrame::createMenu() {
        wxMenu* serverMenu = new wxMenu;
        serverMenu->Append(ID_SERVER_START, "&Start");
        serverMenu->Append(ID_SERVER_START, "S&top");
    
        wxMenuBar* menuBar = new wxMenuBar;
        menuBar->Append(serverMenu, "&Server");
        SetMenuBar(menuBar);
    }
    
    void ServerFrame::createContents() {
    }

}
