#ifndef PYR_RECTANGLE_TOOL_H
#define PYR_RECTANGLE_TOOL_H


#include "Tool.h"


namespace pyr {

    class RectangleTool : public Tool {
    public:
        RectangleTool();
    
        bool onLeftDown(ToolEvent& te);
        bool onLeftUp(ToolEvent& te);
        
    private:
        bool _down;
        float _x;
        float _y;
    };

}


#endif
