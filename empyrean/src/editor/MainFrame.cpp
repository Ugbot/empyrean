#include "MainFrame.h"
#include "MapView.h"
#include "MapUpdateVisitor.h"
#include "RectangleTool.h"
#include "TranslateTool.h"
#include "ObstructionTool.h"
#include "TranslateViewTool.h"
#include "MapFile.h"
#include "MapElement.h"
#include "MapTree.h"
#include "PropertyGridUpdater.h"

namespace pyr {

    static const int MINIMUM_PANE_SIZE = 50;
    static const int DEFAULT_TREE_SIZE = 150;
    
    enum {
        ID_VIEW_TRANSLATE = wxID_HIGHEST,
        ID_VIEW_ZOOM,
    
        ID_TOOL_TRANSLATE,
        ID_TOOL_RECTANGLE,
        ID_TOOL_OBSTRUCTION,
    };

    BEGIN_EVENT_TABLE(MainFrame, wxFrame)
        EVT_MENU(wxID_EXIT, MainFrame::onExit)
        EVT_MENU(wxID_UNDO, MainFrame::onUndo)
        EVT_MENU(wxID_REDO, MainFrame::onRedo)
        
        EVT_TOOL(ID_VIEW_TRANSLATE, MainFrame::onUseTranslateViewTool)
        EVT_TOOL(ID_VIEW_ZOOM,      MainFrame::onUseZoomViewTool)
        
        EVT_TOOL(ID_TOOL_TRANSLATE,   MainFrame::onUseTranslateTool)
        EVT_TOOL(ID_TOOL_RECTANGLE,   MainFrame::onUseRectangleTool)
        EVT_TOOL(ID_TOOL_OBSTRUCTION, MainFrame::onUseObstructionTool)

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

        // Test code, to get a map
        GroupElement* mapRoot = _map->getRoot().get();
        GeometryElement* e = new GeometryElement;
        e->texture = "images/pointer.png";
        e->addVert(gmtl::Vec2f(0, 0), gmtl::Vec2f(0, 0), gmtl::Vec4f(1, 1, 1, 1));
        e->addVert(gmtl::Vec2f(1, 0), gmtl::Vec2f(1, 0), gmtl::Vec4f(1, 1, 1, 1));
        e->addVert(gmtl::Vec2f(1, 1), gmtl::Vec2f(1, 1), gmtl::Vec4f(1, 1, 1, 1));
        e->addVert(gmtl::Vec2f(0, 1), gmtl::Vec2f(0, 1), gmtl::Vec4f(1, 1, 1, 1));
        e->addVert(gmtl::Vec2f(-1, 0), gmtl::Vec2f(1, 0), gmtl::Vec4f(0, 0, 0, 1));
        e->addVert(gmtl::Vec2f(-1, 1), gmtl::Vec2f(1, 1), gmtl::Vec4f(0, 0, 0, 1));
        e->addTri(0, 1, 2);
        e->addTri(0, 2, 3);
        e->addTri(0, 3, 5);
        e->addTri(0, 4, 5);
        mapRoot->children.push_back(e);
        updateTree();
    }

    MainFrame::~MainFrame() {
        clearList(_undoList);
        clearList(_redoList);
    }

    const Map* MainFrame::getMap() const {
        return _map.get();
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
        CommandContext context(_mapTree, _mapView, this, _map.get());

        clearList(_redoList);
        _undoList.push(cmd);
        cmd->perform(&context);
    }

    void MainFrame::updateTree() {
        _mapTree->update(_map.get());
    }

    void MainFrame::updatePropertyGrid() {
        MapElement* e = getSelectedElement();
        // assert(e)?
        
        if (e)
        {
            PropertyGridUpdater pgu(_propertiesGrid);
            e->handleVisitor(pgu);
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
        toolMenu->Append(ID_TOOL_RECTANGLE, "&Rectangle");
        toolMenu->Append(ID_TOOL_OBSTRUCTION, "&Obstruction");
        
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
        toolbar->AddTool(wxID_NEW,  "New",  PNG_BITMAP("editorrc/new.png"));
        toolbar->AddTool(wxID_OPEN, "Open", PNG_BITMAP("editorrc/open.png"));
        toolbar->AddTool(wxID_SAVE, "Save", PNG_BITMAP("editorrc/save.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_VIEW_TRANSLATE, "VTrans", PNG_BITMAP("editorrc/view_translate.png"));
        toolbar->AddTool(ID_VIEW_ZOOM,      "VZoom",  PNG_BITMAP("editorrc/view_zoom.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_TRANSLATE, "Trans", PNG_BITMAP("editorrc/tool_translate.png"));
        toolbar->AddTool(ID_TOOL_RECTANGLE, "Rect",  PNG_BITMAP("editorrc/tool_rect.png"));
        toolbar->AddTool(ID_TOOL_OBSTRUCTION, "Obs", PNG_BITMAP("editorrc/tool_translate.png")); // ah what the hell
        #else
        toolbar->AddTool(wxID_NEW, PNG_BITMAP("editorrc/new.png"));
        toolbar->AddTool(wxID_OPEN, PNG_BITMAP("editorrc/open.png"));
        toolbar->AddTool(wxID_SAVE, PNG_BITMAP("editorrc/save.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_VIEW_TRANSLATE, PNG_BITMAP("editorrc/view_translate.png"));
        toolbar->AddTool(ID_VIEW_ZOOM,      PNG_BITMAP("editorrc/view_zoom.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_TRANSLATE, PNG_BITMAP("editorrc/tool_translate.png"));
        toolbar->AddTool(ID_TOOL_RECTANGLE, PNG_BITMAP("editorrc/tool_rect.png"));
        toolbar->AddTool(ID_TOOL_OBSTRUCTION, PNG_BITMAP("editorrc/tool_translate.png")); // ah what the hell
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
        _mapView->setTool(new TranslateViewTool());
    }

    void MainFrame::onUseZoomViewTool(wxCommandEvent&) {
    }

    void MainFrame::onUseTranslateTool(wxCommandEvent&) {
        _mapView->setTool(new TranslateTool());
    }

    void MainFrame::onUseRectangleTool(wxCommandEvent&) {
        //_mapView->setTool(new RectangleTool(this));
    }

    void MainFrame::onUseObstructionTool(wxCommandEvent&) {
        //_mapView->setTool(new ObstructionTool(this));
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
        _mapTree->getSelection()->handleVisitor(&muv);

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
            CommandContext context(_mapTree, _mapView, this, _map.get());
            c->undo(&context);
        }
    }

    void MainFrame::redo() {
        if (!_redoList.empty()) {
            pyr::Command* c = _redoList.top();
            _redoList.pop();
            _undoList.push(c);
            CommandContext context(_mapTree, _mapView, this, _map.get());
            c->perform(&context);
        }
    }

    void MainFrame::clearList(std::stack<pyr::Command*>& list) {
        while (!list.empty()) {
            pyr::Command* c = list.top();
            delete c;
            list.pop();
        }
    }
}
