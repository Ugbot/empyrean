#ifndef PYR_TRANSLATE_VIEW_TOOL_H
#define PYR_TRANSLATE_VIEW_TOOL_H


#include "Tool.h"


namespace pyr {

    class TranslateViewTool : public Tool {
    public:
        TranslateViewTool();
        
        bool onMouseMove(ToolEvent& event);
        bool onLeftDown(ToolEvent& event);
        bool onLeftUp(ToolEvent& event);
        
    private:
        bool _down;
        gmtl::Vec2f _lastPos;
    };

}


#endif
