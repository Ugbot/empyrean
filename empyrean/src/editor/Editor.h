#ifndef PYR_EDITOR_H
#define PYR_EDITOR_H


#include "wx.h"


namespace pyr {

    class MainFrame;

    class Editor : public wxApp {
    public:
        bool OnInit();
        static MainFrame* getMainFrame();

    private:
        static MainFrame* _theMainFrame;
    };

}

DECLARE_APP(pyr::Editor);


#endif
