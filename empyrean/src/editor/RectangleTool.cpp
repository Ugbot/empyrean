#include "Map.h"
#include "RectangleTool.h"

#include "Command.h"
#include "AddImageCommand.h"

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

        float x = std::min(_x, te.x);
        float y = std::min(_y, te.y);
        float w = (_x > te.x) ? _x - te.x : te.x - _x;
        float h = (_y > te.y) ? _y - te.y : te.y - _y;

        //te.map->addRectangle(_x, _y, te.x, te.y);
        te.cmd->handleCommand(new AddImageCommand(x, y, w, h));
        _down = false;
        return true;
    }

}
