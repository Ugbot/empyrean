#include "Editor.h"
#include "Error.h"
#include "Log.h"
#include "MainFrame.h"
#include "Platform.h"


namespace pyr {

    bool Editor::OnInit() {
        PYR_EXCEPTION_TRAP({
            setStartDirectory(argv[0]);
            initializeLog("editor.log", "editor.log.config");

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
