#ifndef PHUI_MESSAGE_BOX_H
#define PHUI_MESSAGE_BOX_H


#include <string>
#include "ActionListener.h"
#include "Window.h"


// Win32 defines this.
#ifdef MessageBox
#undef MessageBox
#endif


namespace phui {

    class MessageBox : public phui::Window {
    public:
        MessageBox(const std::string& title, const std::string& message);

    private:
        void onOK(const ActionEvent&);
    };

}


#endif
