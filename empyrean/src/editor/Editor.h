#ifndef PYR_EDITOR_H
#define PYR_EDITOR_H


#include "wx.h"


namespace pyr {

    class Editor : public wxApp {
    public:
        bool OnInit();
    };

}

DECLARE_APP(pyr::Editor);


#endif
