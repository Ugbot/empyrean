#include "CreateGeometryTool.h"
#include "MainFrame.h"
#include "MapTree.h"
#include "MapUpdateVisitor.h"
#include "MapView.h"
#include "PropertyGridUpdater.h"
#include "TranslateTool.h"
#include "TranslateViewTool.h"
#include "ZoomViewTool.h"

namespace pyr {

    static const int MINIMUM_PANE_SIZE = 50;
    static const int DEFAULT_TREE_SIZE = 150;
    
    enum {
        ID_VIEW_TRANSLATE = wxID_HIGHEST,
        ID_VIEW_ZOOM,
    
        ID_TOOL_TRANSLATE,

        ID_TOOL_CREATE_GEOMETRY,
    };

    BEGIN_EVENT_TABLE(MainFrame, wxFrame)
        EVT_MENU(wxID_EXIT, MainFrame::onExit)
        EVT_MENU(wxID_UNDO, MainFrame::onUndo)
        EVT_MENU(wxID_REDO, MainFrame::onRedo)
        
        EVT_TOOL(ID_VIEW_TRANSLATE, MainFrame::onUseTranslateViewTool)
        EVT_TOOL(ID_VIEW_ZOOM,      MainFrame::onUseZoomViewTool)
        
        EVT_TOOL(ID_TOOL_TRANSLATE,   MainFrame::onUseTranslateTool)
        
        EVT_TOOL(ID_TOOL_CREATE_GEOMETRY, MainFrame::onUseCreateGeometryTool)

        EVT_GRID_EDITOR_SHOWN(MainFrame::onBeginEditGrid)
        EVT_GRID_CELL_CHANGE(MainFrame::onChangeGrid)

        EVT_TREE_SEL_CHANGED(-1, MainFrame::onSelectTreeNode)
    END_EVENT_TABLE()

    
    MainFrame::MainFrame()
    : wxFrame(0, -1, "pyrEdit", wxDefaultPosition, wxSize(640, 480))
    , _map(new Map)
    {
        createMenu();
        createToolBars();
        createContents();
        createStatusBar();

        updateTree();
    }

    MainFrame::~MainFrame() {
        clearStack(_undoList);
        clearStack(_redoList);
    }

    MapPtr MainFrame::getMap() const {
        return _map;
    }
    
    MapView* MainFrame::getMapView() const {
        return _mapView;
    }
    
    wxGrid* MainFrame::getPropertiesGrid() const {
        return _propertiesGrid;
    }

    MapElement* MainFrame::getSelectedElement() const {
        return _mapTree->getSelection();
    }

    void MainFrame::handleCommand(pyr::Command* cmd) {
        PYR_ASSERT(cmd, "Can't handle null command");

        CommandContext context(_mapTree, _mapView, this, getMap());

        clearStack(_redoList);
        _undoList.push(cmd);
        cmd->perform(context);
    }

    void MainFrame::updateTree() {
        _mapTree->update(getMap());
    }

    void MainFrame::updatePropertyGrid() {
        MapElement* e = getSelectedElement();
        if (e) {
            PropertyGridUpdater pgu(_propertiesGrid);
            e->handleVisitor(pgu);
        } else {
            wxGrid* g = _propertiesGrid;
        
            // Can't have an empty grid, so just have one empty row.  :(
            int delta = 1 - g->GetRows();
            if (delta > 0) {
                g->AppendRows(delta);
            } else if (delta < 0) {
                g->DeleteRows(0, -delta);
            }
            g->SetReadOnly(0, 0); g->SetCellValue("N/A", 0, 0);
            g->SetReadOnly(0, 1); g->SetCellValue("N/A", 0, 1);
            g->AutoSizeColumn(0);
        }
    }

    void MainFrame::createMenu() {
        wxMenu* fileMenu = new wxMenu;
        fileMenu->Append(wxID_NEW,    "&New");
        fileMenu->Append(wxID_OPEN,   "&Open...");
        fileMenu->Append(wxID_SAVE,   "&Save...");
        fileMenu->Append(wxID_SAVEAS, "Save &As...");
        fileMenu->AppendSeparator();
        fileMenu->Append(wxID_EXIT,   "E&xit");
        
        wxMenu* editMenu = new wxMenu;
        editMenu->Append(wxID_UNDO,   "&Undo");
        editMenu->Append(wxID_REDO,   "&Redo");
        editMenu->AppendSeparator();
        editMenu->Append(wxID_CUT,    "Cu&t");
        editMenu->Append(wxID_COPY,   "&Copy");
        editMenu->Append(wxID_PASTE,  "&Paste");
        
        wxMenu* viewMenu = new wxMenu;
        viewMenu->Append(ID_VIEW_TRANSLATE, "&Translate");
        viewMenu->Append(ID_VIEW_ZOOM,      "&Zoom");
        
        wxMenu* toolMenu = new wxMenu;
        toolMenu->Append(ID_TOOL_TRANSLATE, "&Translate");
        toolMenu->AppendSeparator();
        toolMenu->Append(ID_TOOL_CREATE_GEOMETRY, "Create &Geometry");
        
        wxMenu* helpMenu = new wxMenu;
        helpMenu->Append(wxID_ABOUT,  "&About...");

        wxMenuBar* menuBar = new wxMenuBar;
        menuBar->Append(fileMenu, "&File");
        menuBar->Append(editMenu, "&Edit");
        menuBar->Append(viewMenu, "&View");
        menuBar->Append(toolMenu, "&Tools");
        menuBar->Append(helpMenu, "&Help");
        SetMenuBar(menuBar);
    }

    void MainFrame::createToolBars() {
        #define PNG_BITMAP(name) wxBitmap(name, wxBITMAP_TYPE_PNG)
        
        /// @todo depend on wxWindows 2.4.0.  these ifdefs suck.

        int style = wxNO_BORDER | wxTB_HORIZONTAL | wxTB_FLAT;
        #if wxVERSION_NUMBER >= 2400
        style |= wxTB_TEXT;
        #endif
        wxToolBar* toolbar = CreateToolBar(style);

        #if wxVERSION_NUMBER >= 2400
        // This list is the canonical one.  Modify it and then update the other.
        toolbar->AddTool(wxID_NEW,  "New",  PNG_BITMAP("editorrc/new.png"));
        toolbar->AddTool(wxID_OPEN, "Open", PNG_BITMAP("editorrc/open.png"));
        toolbar->AddTool(wxID_SAVE, "Save", PNG_BITMAP("editorrc/save.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_VIEW_TRANSLATE, "VTrans", PNG_BITMAP("editorrc/view_translate.png"));
        toolbar->AddTool(ID_VIEW_ZOOM,      "VZoom",  PNG_BITMAP("editorrc/view_zoom.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_TRANSLATE, "Trans", PNG_BITMAP("editorrc/tool_translate.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_CREATE_GEOMETRY, "Geom", PNG_BITMAP("editorrc/tool_translate.png"));
        #else
        toolbar->AddTool(wxID_NEW,  PNG_BITMAP("editorrc/new.png"));
        toolbar->AddTool(wxID_OPEN, PNG_BITMAP("editorrc/open.png"));
        toolbar->AddTool(wxID_SAVE, PNG_BITMAP("editorrc/save.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_VIEW_TRANSLATE, PNG_BITMAP("editorrc/view_translate.png"));
        toolbar->AddTool(ID_VIEW_ZOOM,      PNG_BITMAP("editorrc/view_zoom.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_TRANSLATE, PNG_BITMAP("editorrc/tool_translate.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_CREATE_GEOMETRY, PNG_BITMAP("editorrc/tool_translate.png"));
        #endif

        // add more stuff
        
        toolbar->Realize();
        
        #undef PNG_BITMAP
    }

    void MainFrame::createContents() {
        // use wxCLIP_CHILDREN to avoid some flicker
        _splitter = new wxSplitterWindow(
            this, -1, wxDefaultPosition, wxDefaultSize,
            wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);

        wxSplitterWindow* split2 = new wxSplitterWindow(
            _splitter, -1, wxDefaultPosition, wxDefaultSize,
            wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);
        
        _mapTree = new MapTree(split2);
        wxTreeItemId root = _mapTree->AddRoot("Root");
        _mapTree->AppendItem(root, "Map");
        _mapTree->AppendItem(root, "Imports");

        _propertiesGrid = new wxGrid(split2, -1);
        _propertiesGrid->CreateGrid(0, 2);
        _propertiesGrid->SetRowLabelSize(0);
        _propertiesGrid->SetColLabelSize(0);

        split2->SetMinimumPaneSize(MINIMUM_PANE_SIZE);
        split2->SplitHorizontally(_mapTree, _propertiesGrid);
        
        _mapView = new MapView(_splitter, this);

        _splitter->SetMinimumPaneSize(MINIMUM_PANE_SIZE);
        _splitter->SplitVertically(split2, _mapView, DEFAULT_TREE_SIZE);
    }

    void MainFrame::createStatusBar() {
        CreateStatusBar();
    }

    void MainFrame::onExit(wxCommandEvent&) {
        Close(true);
    }

    void MainFrame::onUndo(wxCommandEvent&) {
        undo();
    }

    void MainFrame::onRedo(wxCommandEvent&) {
        redo();
    }
    
    void MainFrame::onUseTranslateViewTool(wxCommandEvent&) {
        _mapView->setTool(new TranslateViewTool);
    }

    void MainFrame::onUseZoomViewTool(wxCommandEvent&) {
        _mapView->setTool(new ZoomViewTool);
    }

    void MainFrame::onUseTranslateTool(wxCommandEvent&) {
        _mapView->setTool(new TranslateTool);
    }
    
    void MainFrame::onUseCreateGeometryTool(wxCommandEvent&) {
        _mapView->setTool(new CreateGeometryTool);
    }

    void MainFrame::onBeginEditGrid(wxGridEvent& event) {
        // ?
    }

    void MainFrame::onChangeGrid(wxGridEvent& event) {
        int row = event.GetRow();
 
        GridEvent e;
        e.cmd = this;
        e.name = _propertiesGrid->GetCellValue(row, 0).c_str();     // the property that was changed
        e.value = _propertiesGrid->GetCellValue(row, 1).c_str();    // the value it was changed to

        MapUpdateVisitor muv(e.name, e.value);
        _mapTree->getSelection()->handleVisitor(muv);

        bool result = true;
            _mapView->getTool()->onPropertiesChanged(e);
        if (result) {
            _mapView->Refresh();
        }
    }

    void MainFrame::onSelectTreeNode(wxTreeEvent& event) {
        updatePropertyGrid();
    }

    void MainFrame::undo() {
        if (!_undoList.empty()) {
            pyr::Command* c = _undoList.top();
            _undoList.pop();
            _redoList.push(c);
            CommandContext context(_mapTree, _mapView, this, getMap());
            c->undo(context);
        }
    }

    void MainFrame::redo() {
        if (!_redoList.empty()) {
            pyr::Command* c = _redoList.top();
            _redoList.pop();
            _undoList.push(c);
            CommandContext context(_mapTree, _mapView, this, getMap());
            c->perform(context);
        }
    }

    void MainFrame::clearStack(std::stack<pyr::Command*>& stack) {
        while (!stack.empty()) {
            pyr::Command* c = stack.top();
            delete c;
            stack.pop();
        }
    }
}
