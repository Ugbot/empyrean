
#include "MapFile.h"
#include "RectangleTool.h"

#include "Command.h"
#include "AddImageCommand.h"

#include "Utility.h"

#include "OpenGL.h"

namespace pyr {

    RectangleTool::RectangleTool(MapView* mv)
        : Tool(mv)
    {
        _down = false;
        _x = 0;
        _y = 0;
    }

    bool RectangleTool::onMouseMove(ToolEvent& te) {
        if (_down) {
            _x2 = te.x;
            _y2 = te.y;
        }

        return _down; // EVERYBODY WANG CHUNG TONIGHT.
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

        te.cmd->handleCommand(new AddImageCommand(x, y, w, h));
        _down = false;
        return true;
    }

    void RectangleTool::onRender() {
        if (_down) {
            glColor4f(1, 1, 1, 1);
            glBegin(GL_LINE_LOOP);
            glVertex2f(_x,  _y);
            glVertex2f(_x2, _y);
            glVertex2f(_x2, _y2);
            glVertex2f(_x,  _y2);
            glEnd();
        }
    }
}
