#ifndef PHUI_LAYOUT_H
#define PHUI_LAYOUT_H


#include "RefCounted.h"
#include "RefPtr.h"


namespace phui {

    class Widget;

    class Layout : public pyr::RefCounted {
    public:
        /**
         * widget is not a smart pointer because this is called indirectly
         * from WidgetContainer's constructor, which causes the container to be
         * deleted.
         */
        virtual void layout(Widget* widget) = 0;
    };
    
    typedef pyr::RefPtr<Layout> LayoutPtr;
        
}


#endif
