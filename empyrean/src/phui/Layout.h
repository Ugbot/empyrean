#ifndef PHUI_LAYOUT_H
#define PHUI_LAYOUT_H


#include "RefCounted.h"
#include "RefPtr.h"


namespace phui {

    class WidgetContainer;

    class Layout : public pyr::RefCounted {
    public:
        /** container is not a smart pointer because this is called indirectly
         * from WidgetContainer's constructor, which causes the container to be
         * deleted. */
        virtual void layout(WidgetContainer* container) = 0;
    };
    
    typedef pyr::RefPtr<Layout> LayoutPtr;
        
}


#endif
