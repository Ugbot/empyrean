#include "Editor.h"
#include "Error.h"
#include "MainFrame.h"


#if defined(WIN32)

    #include <windows.h>

    inline void setStartDirectory() {
        // set the current path to where the executable resides
        char filename[MAX_PATH];
        GetModuleFileName(GetModuleHandle(0), filename, MAX_PATH);

        // remove the basename
        char* backslash = strrchr(filename, '\\');
        if (backslash) {
            *backslash = 0;
            SetCurrentDirectory(filename);
        }
    }
    
#else

    inline void setStartDirectory() {
    }
    
#endif


namespace pyr {

    bool Editor::OnInit() {
        PYR_BEGIN_EXCEPTION_TRAP()
        
            setStartDirectory();
        
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
