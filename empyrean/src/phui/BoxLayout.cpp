#include "BoxLayout.h"
#include "Size.h"
#include "WidgetContainer.h"


namespace phui {

    BoxLayout::BoxLayout(Type type) {
        _type = type;
        _margin = Insets(10, 10, 10, 10);
        _spacing = 10;
    }

    void BoxLayout::layout(WidgetContainer* container) {
        if (container->getNumChildren() == 0) {
            return;
        }        
    
        Size s = container->getSize();
        int top    = _margin.getTop();
        int bottom = _margin.getBottom();
        int left   = _margin.getLeft();
        int right  = _margin.getRight();

        if (_type == VERTICAL) {
            int total_height = s.getHeight() - top - bottom + _spacing;
            int widget_height = total_height / container->getNumChildren();
            
            for (size_t i = 0; i < container->getNumChildren(); ++i) {
                Rect r;
                r.x      = left;
                r.y      = top + i * widget_height;
                r.width  = s.getWidth() - r.x - right;
                r.height = widget_height - _spacing;
                
                container->getChild(i)->setPositionAndSize(r);
            }
        } else if (_type == HORIZONTAL) {
            int total_width = s.getWidth() - left - right + _spacing;
            int widget_width = total_width / container->getNumChildren();
            
            for (size_t i = 0; i < container->getNumChildren(); ++i) {
                Rect r;
                r.x      = right + i * widget_width;
                r.y      = top;
                r.width  = widget_width - _spacing;
                r.height = s.getHeight() - r.y - bottom;
                
                container->getChild(i)->setPositionAndSize(r);
            }
        }
    }

}
