#ifndef PHUI_FLOW_LAYOUT_H
#define PHUI_FLOW_LAYOUT_H


#include "Insets.h"
#include "Layout.h"


namespace phui {

    class BoxLayout : public Layout {
    public:
        enum Type {
            HORIZONTAL,
            VERTICAL,
        };
        
        BoxLayout(Type type);
    
        void layout(Widget* widget);   
        
    private:
        Type _type;
        Insets _margin;
        int _spacing;
    };
}

#endif
