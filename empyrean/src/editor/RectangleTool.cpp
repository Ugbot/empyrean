#include "Map.h"
#include "RectangleTool.h"


namespace pyr {

    RectangleTool::RectangleTool() {
        _down = false;
        _x = 0;
        _y = 0;
    }

    bool RectangleTool::onLeftDown(ToolEvent& te) {
        _x = te.x;
        _y = te.y;
        _down = true;
        return false;
    }    
    
    bool RectangleTool::onLeftUp(ToolEvent& te) {
        if (!_down || _x == te.x || _y == te.y) {
            return false;
        }

        te.map->addRectangle(_x, _y, te.x, te.y);
        _down = false;
        return true;
    }

}
