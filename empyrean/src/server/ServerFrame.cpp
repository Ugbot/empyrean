#include "Configuration.h"
#include "Error.h"
#include "Log.h"
#include "LogEvent.h"
#include "ServerApp.h"
#include "ServerFrame.h"


namespace pyr {

    enum {
        ID_SERVER_START = wxID_HIGHEST,
        ID_SERVER_STOP,
        ID_SERVER_RESTART,
        ID_SERVER_OPTIONS,
        
        ID_DATABASE_ACCOUNTS,
        ID_DATABASE_GAMES,
    };
    

    BEGIN_EVENT_TABLE(ServerFrame, wxFrame)
        EVT_CLOSE(ServerFrame::onClose)
    
        EVT_MENU(ID_SERVER_START,   ServerFrame::onStart)
        EVT_MENU(ID_SERVER_STOP,    ServerFrame::onStop)
        EVT_MENU(ID_SERVER_RESTART, ServerFrame::onRestart)
        EVT_MENU(wxID_EXIT,         ServerFrame::onExit)
        
        EVT_CUSTOM(EVT_LOG, 0, ServerFrame::onLog)
        
        EVT_UPDATE_UI(ID_SERVER_START,   ServerFrame::onUpdateUI)
        EVT_UPDATE_UI(ID_SERVER_STOP,    ServerFrame::onUpdateUI)
        EVT_UPDATE_UI(ID_SERVER_RESTART, ServerFrame::onUpdateUI)
    END_EVENT_TABLE()
    
    
    ServerFrame::ServerFrame()
        : wxFrame(0, -1, "Empyrean Server",
                  the<Configuration>().windowPosition,
                  the<Configuration>().windowSize)
    {
        createMenu();
        createContents();
        createStatusBar();
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
        
        wxMenu* databaseMenu = new wxMenu;
        databaseMenu->Append(ID_DATABASE_ACCOUNTS,   "&Accounts...");
        databaseMenu->Append(ID_DATABASE_GAMES,      "&Games...");

        wxMenuBar* menuBar = new wxMenuBar;
        menuBar->Append(serverMenu,   "&Server");
        menuBar->Append(databaseMenu, "&Database");
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

    void ServerFrame::onClose(wxCloseEvent& evt) {
        PYR_BEGIN_EXCEPTION_TRAP()
            the<Configuration>().windowPosition = GetPosition();
            the<Configuration>().windowSize     = GetSize();
            Destroy();
        PYR_END_EXCEPTION_TRAP()
    }

    void ServerFrame::onStart() {
        PYR_BEGIN_EXCEPTION_TRAP()
            wxGetApp().start();
        PYR_END_EXCEPTION_TRAP()
    }

    void ServerFrame::onStop() {
        PYR_BEGIN_EXCEPTION_TRAP()
            wxGetApp().stop();
        PYR_END_EXCEPTION_TRAP()
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
    
    void ServerFrame::onLog(LogEvent& evt) {
        wxDateTime time = evt.getTime();
        _contents->AppendToPage(
            "<b>" + time.FormatISODate() + "</b> - " +
            "<b>" + time.FormatISOTime() + "</b> - " +
            evt.getMessage().c_str() + "<br />");
    }
    

}
