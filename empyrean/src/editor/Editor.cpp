#include "Editor.h"
#include "Error.h"
#include "MainFrame.h"
#include "Platform.h"


namespace pyr {

    bool Editor::OnInit() {
        PYR_BEGIN_EXCEPTION_TRAP()
        
            setStartDirectory(argc, argv);
        
            // we use PNG images for the UI
            wxInitAllImageHandlers();
    
            _theMainFrame = new MainFrame;
            _theMainFrame->Show(true);
            return true;
            
        PYR_END_EXCEPTION_TRAP()
        return false;
    }

    MainFrame* Editor::getMainFrame() {
        return _theMainFrame;
    }

    MainFrame* Editor::_theMainFrame = 0;

}
