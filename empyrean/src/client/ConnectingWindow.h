#ifndef PYR_CONNECTING_WINDOW_H
#define PYR_CONNECTING_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class ConnectingWindow : public phui::Window, public phui::ModalListener {
    public:
        ConnectingWindow();
        
        void update(float dt);
        
    private:
        void onCancel(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);
    };

}


#endif
