#include "Editor.h"
#include "MainFrame.h"


namespace pyr {

    bool Editor::OnInit() {
        // we use PNG images for the UI
        wxInitAllImageHandlers();
    
        MainFrame* frame = new MainFrame();
        frame->Show(true);
        return true;
    }

}
