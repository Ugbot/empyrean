#ifndef PHUI_NULL_LAYOUT_H
#define PHUI_NULL_LAYOUT_H


#include "Layout.h"


namespace phui {

    class NullLayout : public Layout {
    public:
        void layout(WidgetContainer* /*container*/) {
        }
    };
    
}


#endif
