#ifndef PYR_MAIN_FRAME_H
#define PYR_MAIN_FRAME_H

#include <stack>
#include "wx.h"
#include "Command.h"
#include "Utility.h"

namespace pyr {

    class MapView;
    class MapTree;

    // HACK THE MAINFRAME
    class MainFrame : public wxFrame, public CommandReciever {
        friend class Tool;
    public:

        const Map* getMap() const;

        virtual void handleCommand(::pyr::Command* cmd);
        void updateTree();

        MainFrame();
        ~MainFrame();

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
        void onSelectTreeNode(wxTreeEvent& event);

        // Other junk
        void undo();
        void redo();
        
    private:
        // contents
        wxSplitterWindow* _splitter;
        MapTree* _mapTree;
        MapView* _mapView;
        wxGrid* _propertiesGrid;

        std::stack<pyr::Command*> _undoList;
        std::stack<pyr::Command*> _redoList;
        void clearList(std::stack<pyr::Command*>& list); // deletes and clears

        ScopedPtr<Map> _map;
        
        DECLARE_EVENT_TABLE()
    };

}


#endif
