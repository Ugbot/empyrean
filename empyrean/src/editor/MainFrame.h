#ifndef PYR_MAIN_FRAME_H
#define PYR_MAIN_FRAME_H

#include <stack>
#include "wx.h"
#include "Command.h"
#include "Map.h"
#include "Utility.h"

namespace pyr {

    class MapView;
    class MapTree;
    class MapElement;

    // HACK THE MAINFRAME
    class MainFrame : public wxFrame, public CommandReceiver {
    public:
        MainFrame();
        ~MainFrame();

        const Map* getMap() const;
        MapView* getMapView() const;
        wxGrid* getPropertiesGrid() const;
        MapElement* getSelectedElement() const;
        
        void handleCommand(pyr::Command* cmd);
        void updateTree();
        void updatePropertyGrid();

    private:
        void createMenu();
        void createToolBars();
        void createContents();
        void createStatusBar();
       
        // events
        void onExit(wxCommandEvent&);
        void onUndo(wxCommandEvent&);
        void onRedo(wxCommandEvent&);
        
        // view tools
        void onUseTranslateViewTool(wxCommandEvent&);
        void onUseZoomViewTool(wxCommandEvent&);
        
        // object modification tools
        void onUseTranslateTool(wxCommandEvent&);
        
        // creation tools
        void onUseCreateGeometryTool(wxCommandEvent&);
        
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
        void clearStack(std::stack<pyr::Command*>& list); // deletes and clears

        Map _map;
        
        DECLARE_EVENT_TABLE()
    };

}


#endif
