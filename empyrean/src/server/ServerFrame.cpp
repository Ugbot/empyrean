#include "Server.h"
#include "ServerFrame.h"


namespace pyr {

    enum {
        ID_SERVER_START = wxID_HIGHEST,
        ID_SERVER_STOP,
        ID_SERVER_RESTART,
        ID_SERVER_OPTIONS,
    };
    

    BEGIN_EVENT_TABLE(ServerFrame, wxFrame)
        EVT_MENU(ID_SERVER_START,   ServerFrame::onStart)
        EVT_MENU(ID_SERVER_STOP,    ServerFrame::onStop)
        EVT_MENU(ID_SERVER_RESTART, ServerFrame::onRestart)
        EVT_MENU(wxID_EXIT,         ServerFrame::onExit)
        
        EVT_UPDATE_UI(ID_SERVER_START,   ServerFrame::onUpdateUI)
        EVT_UPDATE_UI(ID_SERVER_STOP,    ServerFrame::onUpdateUI)
        EVT_UPDATE_UI(ID_SERVER_RESTART, ServerFrame::onUpdateUI)
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
        serverMenu->Append(ID_SERVER_START,   "&Start");
        serverMenu->Append(ID_SERVER_STOP,    "S&top");
        serverMenu->Append(ID_SERVER_RESTART, "&Restart");
        serverMenu->AppendSeparator();
        serverMenu->Append(ID_SERVER_OPTIONS, "&Options...");
        serverMenu->AppendSeparator();
        serverMenu->Append(wxID_EXIT,         "E&xit");
    
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
        wxGetApp().start();
    }
    
    void ServerFrame::onStop() {
        log("Stopping...");
        wxGetApp().stop();
    }
    
    void ServerFrame::onRestart() {
        onStop();
        onStart();
    }
    
    void ServerFrame::onExit() {
        Close();
    }
    
    void ServerFrame::onUpdateUI(wxUpdateUIEvent& evt) {
        switch (evt.GetId()) {
            case ID_SERVER_START:   evt.Enable(!wxGetApp().isRunning()); break;
            case ID_SERVER_STOP:    evt.Enable( wxGetApp().isRunning()); break;
            case ID_SERVER_RESTART: evt.Enable( wxGetApp().isRunning()); break;
        }
    }
}
