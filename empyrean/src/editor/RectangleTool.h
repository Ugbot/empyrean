#ifndef PYR_RECTANGLE_TOOL_H
#define PYR_RECTANGLE_TOOL_H


#include "Tool.h"


namespace pyr {

    class RectangleTool : public Tool {
    public:
        RectangleTool(MapView* mv);
    
        virtual bool onMouseMove(ToolEvent& te);
        virtual bool onLeftDown(ToolEvent& te);
        virtual bool onLeftUp(ToolEvent& te);
        virtual void onRender();
        
    private:
        bool _down;
        float _x;
        float _y;
        float _x2;
        float _y2;
    };

}


#endif
