#include "Server.h"
#include "ServerFrame.h"


namespace pyr {

    enum {
        ID_SERVER_START = wxID_HIGHEST,
        ID_SERVER_STOP,
    };
    

    BEGIN_EVENT_TABLE(ServerFrame, wxFrame)
        EVT_MENU(ID_SERVER_START, ServerFrame::onStart)
        EVT_MENU(ID_SERVER_STOP,  ServerFrame::onStop)
    END_EVENT_TABLE()
    
    
    ServerFrame::ServerFrame()
        : wxFrame(0, -1, "Empyrean Server")
    {
        createMenu();
        createContents();
        createStatusBar();
    }

    void ServerFrame::log(const std::string& s) {
        _contents->AppendToPage(("<p>" + s + "</p>").c_str());
    }
    
    void ServerFrame::createMenu() {
        wxMenu* serverMenu = new wxMenu;
        serverMenu->Append(ID_SERVER_START, "&Start");
        serverMenu->Append(ID_SERVER_STOP,  "S&top");
    
        wxMenuBar* menuBar = new wxMenuBar;
        menuBar->Append(serverMenu, "&Server");
        SetMenuBar(menuBar);
    }
    
    void ServerFrame::createContents() {
        _contents = new wxHtmlWindow(
            this, -1, wxDefaultPosition, wxDefaultSize,
            wxHW_SCROLLBAR_AUTO | wxSUNKEN_BORDER);
    }
    
    void ServerFrame::createStatusBar() {
        CreateStatusBar();
    }
    
    void ServerFrame::onStart() {
        
        log("Starting...");
    }
    
    void ServerFrame::onStop() {
        log("Stopping...");
    }
}
