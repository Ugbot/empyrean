#include "MainFrame.h"
#include "MapView.h"
#include "RectangleTool.h"
#include "TranslateTool.h"


namespace pyr {

    static const int MINIMUM_PANE_SIZE = 50;
    static const int DEFAULT_TREE_SIZE = 150;
    
    enum {
        ID_TOOL_TRANSLATE = wxID_HIGHEST,
        ID_TOOL_RECTANGLE,
    };


    BEGIN_EVENT_TABLE(MainFrame, wxFrame)
    END_EVENT_TABLE()
    
    MainFrame::MainFrame()
        : wxFrame(0, -1, "pyrEdit", wxDefaultPosition, wxSize(640, 480))
    {
        createMenu();
        createToolBars();
        createContents();
        createStatusBar();
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
        
        wxMenu* toolMenu = new wxMenu;
        toolMenu->Append(ID_TOOL_TRANSLATE, "&Translate");
        toolMenu->Append(ID_TOOL_RECTANGLE, "&Rectangle");
        
        wxMenu* helpMenu = new wxMenu;
        helpMenu->Append(wxID_ABOUT,  "&About...");

        wxMenuBar* menuBar = new wxMenuBar;
        menuBar->Append(fileMenu, "&File");
        menuBar->Append(editMenu, "&Edit");
        menuBar->Append(toolMenu, "&Tools");
        menuBar->Append(helpMenu, "&Help");
        SetMenuBar(menuBar);
    }
    
    void MainFrame::createToolBars() {
        #define PNG_BITMAP(name) wxBitmap(name, wxBITMAP_TYPE_PNG)
        
        wxToolBar* toolbar = CreateToolBar(
            wxNO_BORDER | wxTB_HORIZONTAL | wxTB_FLAT | wxTB_TEXT);
        toolbar->AddTool(wxID_NEW,  "New",  PNG_BITMAP("new.png"));
        toolbar->AddTool(wxID_OPEN, "Open", PNG_BITMAP("open.png"));
        toolbar->AddTool(wxID_SAVE, "Save", PNG_BITMAP("save.png"));
        toolbar->AddSeparator();
        toolbar->AddTool(ID_TOOL_TRANSLATE, "Trans", PNG_BITMAP("tool_translate.png"));
        toolbar->AddTool(ID_TOOL_RECTANGLE, "Rect",  PNG_BITMAP("tool_rect.png"));
        
        // add more stuff
        
        toolbar->Realize();
        
        #undef PNG_BITMAP
    }
    
    void MainFrame::createContents() {
//        typedef TranslateTool DefaultTool;
        typedef RectangleTool DefaultTool;
    
    
        // use wxCLIP_CHILDREN to avoid some flicker
        _splitter = new wxSplitterWindow(
            this, -1, wxDefaultPosition, wxDefaultSize,
            wxSP_3D | wxSP_LIVE_UPDATE | wxCLIP_CHILDREN);
        
        _mapTree = new wxTreeCtrl(_splitter, -1);
        wxTreeItemId root = _mapTree->AddRoot("Root");
        _mapTree->AppendItem(root, "Part 1");
        _mapTree->AppendItem(root, "Part 2");
        
        _mapView = new MapView(_splitter, new DefaultTool());

        _splitter->SetMinimumPaneSize(MINIMUM_PANE_SIZE);
        _splitter->SplitVertically(_mapTree, _mapView, DEFAULT_TREE_SIZE);
    }
    
    void MainFrame::createStatusBar() {
        CreateStatusBar();
    }

}