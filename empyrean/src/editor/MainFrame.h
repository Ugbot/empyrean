#ifndef PYR_MAIN_FRAME_H
#define PYR_MAIN_FRAME_H


#include "wx.h"


namespace pyr {

    class MapView;


    // HACK THE MAINFRAME
    class MainFrame : public wxFrame {
    public:
        MainFrame();
        
    private:
        void createMenu();
        void createToolBars();
        void createContents();
        void createStatusBar();
        
        // contents
        wxSplitterWindow* _splitter;
        wxTreeCtrl* _mapTree;
        MapView* _mapView;

        // events
        void onExit(wxCommandEvent&);
        void onUndo(wxCommandEvent&);
        void onRedo(wxCommandEvent&);
        
        DECLARE_EVENT_TABLE()
    };

}


#endif
