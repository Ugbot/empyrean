#ifndef PYR_MAIN_FRAME_H
#define PYR_MAIN_FRAME_H

#include <stack>
#include "wx.h"
#include "Command.h"

namespace pyr {

    class MapView;


    // HACK THE MAINFRAME
    class MainFrame : public wxFrame, public CommandReciever {
        friend class Tool;
    public:
        MainFrame();
        ~MainFrame();
        
        const Map* getMap() const;

        virtual void handleCommand(::pyr::Command* cmd);

    protected:
        // contents
        wxSplitterWindow* _splitter;
        wxTreeCtrl* _mapTree;
        MapView* _mapView;
        wxGrid* _propertiesGrid;

    private:
        void createMenu();
        void createToolBars();
        void createContents();
        void createStatusBar();
        
        // events
        void onExit(wxCommandEvent&);
        void onUndo(wxCommandEvent&);
        void onRedo(wxCommandEvent&);
        void onUseImageTool(wxCommandEvent&);
        void onUseObstructionTool(wxCommandEvent&);
        void onBeginEditGrid(wxGridEvent& event);
        void onChangeGrid(wxGridEvent& event);

        // Other junk
        void undo();
        void redo();
        
        std::stack<pyr::Command*> _undoList;
        std::stack<pyr::Command*> _redoList;
        void clearList(std::stack<pyr::Command*>& list); // deletes and clears

        Map* _map;
        
        DECLARE_EVENT_TABLE()
    };

}


#endif
