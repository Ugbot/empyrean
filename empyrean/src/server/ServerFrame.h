#ifndef PYR_SERVER_FRAME_H
#define PYR_SERVER_FRAME_H


#include <string>
#include "wx.h"


namespace pyr {

    class ServerFrame : public wxFrame {
    public:
        ServerFrame();

        void log(const std::string& s);
        
    private:
        void createMenu();
        void createContents();
        void createStatusBar();
        
        void onStart();
        void onStop();
        
        wxHtmlWindow* _contents;
    
        DECLARE_EVENT_TABLE()
    };

}


#endif
