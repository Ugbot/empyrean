#ifndef PYR_CONNECT_WINDOW_H
#define PYR_CONNECT_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class ConnectWindow : public phui::Window, public phui::ModalListener {
    public:
        ConnectWindow();
        
    private:
        void onConnect(const phui::ActionEvent&);
        void onCancel(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);
        
        phui::TextFieldPtr _server;
    };

}


#endif
