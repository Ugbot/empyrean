#ifndef PYR_RECTANGLE_TOOL_H
#define PYR_RECTANGLE_TOOL_H


#include "Tool.h"


namespace pyr {

    class RectangleTool : public Tool {
    public:
        RectangleTool();
    
        virtual bool onMouseMove(ToolEvent& te);
        virtual bool onLeftDown(ToolEvent& te);
        virtual bool onLeftUp(ToolEvent& te);
        virtual bool onPropertiesChanged(GridEvent& event);
        virtual void onRender();
        
    private:
        bool idleMouseDown(ToolEvent& te);
        bool idleMouseMove(ToolEvent& te);
        bool idleMouseUp(ToolEvent& te);

        bool movingMouseMove(ToolEvent& te);
        bool movingMouseUp(ToolEvent& te);

        bool draggingNewMouseMove(ToolEvent& te);
        bool draggingNewMouseUp(ToolEvent& te);

        // Puts the properties of the given rectangle into the properties grid.
        void updatePropertiesGrid(int index);

        enum {
            Idle,
            DraggingNew,
            MovingSelection,
        } _state;
        int _selectedRect;
        float _x;
        float _y;
        float _x2;
        float _y2;
    };

}


#endif
