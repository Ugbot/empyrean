#ifndef PYR_LOGGING_IN_WINDOW_H
#define PYR_LOGGING_IN_WINDOW_H


#include <phui/phui.h>


namespace pyr {

    class LoggingInWindow : public phui::Window, public phui::ModalListener {
    public:
        LoggingInWindow();

        void update(float dt);

    private:
        void onCancel(const phui::ActionEvent&);

        void onEndModal(Widget* widget, int result);
    };
    
}


#endif
