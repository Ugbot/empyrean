#ifndef PHUI_MODAL_LISTENER_H
#define PHUI_MODAL_LISTENER_H


namespace phui {

    class ModalListener {
    public:
        virtual ~ModalListener() { }

        virtual void onEndModal(Widget* widget, int result) = 0;
    };

}


#endif
