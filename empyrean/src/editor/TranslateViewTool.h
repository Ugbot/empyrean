#ifndef PYR_TRANSLATE_VIEW_TOOL_H
#define PYR_TRANSLATE_VIEW_TOOL_H


#include "Tool.h"


namespace pyr {

    class TranslateViewTool : public Tool {
    public:
        TranslateViewTool() {
            _down = false;
        }
    
        bool onMouseMove(ToolEvent& event) {
            if (_down) {
                getMapView()->getViewCenter() += (_lastPos - event.pos);
                _lastPos = event.pos;
                return true;
            } else {
                return false;
            }
        }
        
        bool onLeftDown(ToolEvent& event) {
            _lastPos = event.pos;
            _down = true;
            return false;
        }
        
        bool onLeftUp(ToolEvent& event) {
            _down = false;
            return false;
        }
        
    private:
        bool _down;
        gmtl::Vec2f _lastPos;
    };

}


#endif
