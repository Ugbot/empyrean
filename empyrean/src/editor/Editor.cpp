#include "Editor.h"
#include "Error.h"
#include "Log.h"
#include "MainFrame.h"
#include "Platform.h"


namespace pyr {

    bool Editor::OnInit() {
        PYR_EXCEPTION_TRAP({
        
            the<Log>().open(getStartDirectory(argc, argv) + "/editor.log");
        
            setStartDirectory(argc, argv);
        
            // we use PNG images for the UI
            wxInitAllImageHandlers();
    
            _theMainFrame = new MainFrame;
            _theMainFrame->Show(true);
            return true;
            
        })
        return false;
    }

    MainFrame* Editor::getMainFrame() {
        return _theMainFrame;
    }

    MainFrame* Editor::_theMainFrame = 0;

}
