#ifndef PYR_SERVER_FRAME_H
#define PYR_SERVER_FRAME_H


#include <string>
#include "wx.h"


namespace pyr {

    class LogEvent;

    class ServerFrame : public wxFrame {
    public:
        ServerFrame();

    private:
        void createMenu();
        void createContents();
        void createStatusBar();
        
        void onStart();
        void onStop();
        void onRestart();
        void onExit();
        void onUpdateUI(wxUpdateUIEvent& evt);
        
        void onLog(LogEvent& evt);
        
        wxHtmlWindow* _contents;
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
