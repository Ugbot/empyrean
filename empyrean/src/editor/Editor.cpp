#include "Editor.h"
#include "MainFrame.h"


namespace pyr {

    bool Editor::OnInit() {
        // we use PNG images for the UI
        wxInitAllImageHandlers();
    
        _theMainFrame = new MainFrame;
        _theMainFrame->Show(true);
        return true;
    }

    MainFrame* Editor::getMainFrame() {
        return _theMainFrame;
    }

    MainFrame* Editor::_theMainFrame = 0;

}
