#include "BoxLayout.h"
#include "Size.h"
#include "Widget.h"


namespace phui {

    BoxLayout::BoxLayout(Type type) {
        _type = type;
        _margin = Insets(10, 10, 10, 10);
        _spacing = 10;
    }

    void BoxLayout::layout(Widget* widget) {
        if (widget->getChildCount() == 0) {
            return;
        }

        Size s = widget->getSize();
        int top    = _margin.getTop();
        int bottom = _margin.getBottom();
        int left   = _margin.getLeft();
        int right  = _margin.getRight();

        if (_type == VERTICAL) {
            int total_height = s.getHeight() - top - bottom + _spacing;
            size_t widget_height = total_height / widget->getChildCount();
            
            for (size_t i = 0; i < widget->getChildCount(); ++i) {
                Rect r;
                r.x      = left;
                r.y      = int(top + i * widget_height);
                r.width  = s.getWidth() - r.x - right;
                r.height = int(widget_height - _spacing);
                
                widget->getChild(i)->setPositionAndSize(r);
            }
        } else if (_type == HORIZONTAL) {
            int total_width = s.getWidth() - left - right + _spacing;
            size_t widget_width = total_width / widget->getChildCount();
            
            for (size_t i = 0; i < widget->getChildCount(); ++i) {
                Rect r;
                r.x      = int(right + i * widget_width);
                r.y      = top;
                r.width  = int(widget_width - _spacing);
                r.height = s.getHeight() - r.y - bottom;
                
                widget->getChild(i)->setPositionAndSize(r);
            }
        }
    }

}
