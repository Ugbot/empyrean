
#include <map>
#include <string>

#include "MapFile.h"
#include "RectangleTool.h"

#include "Command.h"
#include "AddRectCommand.h"
#include "ChangeRectPropertiesCommand.h"

#include "OpenGL.h"
#include "Utility.h"

#include "MapView.h"

namespace pyr {

    RectangleTool::RectangleTool(MainFrame* mf)
        : Tool(mf)
        , _x(0)
        , _y(0)
        , _x2(0)
        , _y2(0)
        , _selectedRect(-1)
        , _state(Idle)

    {
        std::map<std::string, std::string> properties;
        setPropertiesGrid(properties);
    }

    bool RectangleTool::onMouseMove(ToolEvent& te) {
        switch (_state) {
            case MovingSelection:   return movingMouseMove(te);
            case Idle:              return idleMouseMove(te);
            case DraggingNew:       return draggingNewMouseMove(te);
            default:
                // assert(false?)
                return false;
        };
    }

    bool RectangleTool::onLeftDown(ToolEvent& te) {
        switch (_state) {
            case Idle:              return idleMouseDown(te);

            case MovingSelection:
            case DraggingNew:
            default:
                return false;
        };
    }    
    
    bool RectangleTool::onLeftUp(ToolEvent& te) {
        switch (_state) {
            case MovingSelection:   return movingMouseUp(te);
            case DraggingNew:       return draggingNewMouseUp(te);
            case Idle:
            default:
                return false;
        };
    }

    bool RectangleTool::onPropertiesChanged(GridEvent& event) {
        const std::string& n = event.name;
        const std::string& v = event.value;

        ChangeRectPropertiesCommand* cmd = new ChangeRectPropertiesCommand(
            _selectedRect, getMap()->_terrain.rects[_selectedRect]);

        if (n == "filename") {
            cmd->setTextureName(v);
        } else if (n == "x") {
            cmd->setX(atof(v.c_str()));
        } else if (n == "y") {
            cmd->setY(atof(v.c_str()));
        } else if (n == "width") {
            cmd->setWidth(atof(v.c_str()));
        } else if (n == "height") {
            cmd->setHeight(atof(v.c_str()));
        } else {
            delete cmd;
            return false;
        }

        event.cmd->handleCommand(cmd);
        updatePropertiesGrid(_selectedRect);
        return true;
    }

    void RectangleTool::onRender() {
        if (_selectedRect != -1) {
            const MapFile::Rect& rect = getMap()->_terrain.rects[_selectedRect];

            float x, y;
            if (_state == MovingSelection) {
                x = _x2;
                y = _y2;

                MapFile::Rect i = rect;
                i.x = x;
                i.y = y;
                glColor4f(1, 1, 1, 0.5f);
                glEnable(GL_TEXTURE_2D);
                getMapView()->drawRect(&i);
                glDisable(GL_TEXTURE_2D);
                glColor4f(1, 1, 1, 1);
            } else {
                x = rect.x;
                y = rect.y;
            }

            glColor4f(1, 1, 1, 1);
            glBegin(GL_LINE_LOOP);
            glVertex2f(x, y);
            glVertex2f(x + rect.width, y);
            glVertex2f(x + rect.width, y + rect.height);
            glVertex2f(x, y + rect.height);
            glEnd();
        }
        if (_state == DraggingNew) {
            glColor4f(1, 1, 1, 1);
            glBegin(GL_LINE_LOOP);
            glVertex2f(_x,  _y);
            glVertex2f(_x2, _y);
            glVertex2f(_x2, _y2);
            glVertex2f(_x,  _y2);
            glEnd();
        }
    }
    bool RectangleTool::movingMouseMove(ToolEvent& te) {
        _x2 = te.x - _x;
        _y2 = te.y - _y;
        return true;
    }

    bool RectangleTool::movingMouseUp(ToolEvent& te) {
        te.cmd->handleCommand(
            (new ChangeRectPropertiesCommand(_selectedRect, getMap()->_terrain.rects[_selectedRect]))
            ->setPosition(_x2, _y2));
        _state = Idle;
        updatePropertiesGrid(_selectedRect);
        return true;
    }

    bool RectangleTool::idleMouseDown(ToolEvent& te) {
        if (te.ctrl) {
            _x = te.x;
            _y = te.y;
            _state = DraggingNew;
            return false;
        } else {
            // If an rect is under the cursor, grab the one with the highest z value
            int best = -1;
            const std::vector<MapFile::Rect>& rects = getMap()->_terrain.rects;
            // Simple brute force rect/point detection loop.  wee.
            for (unsigned i = 0; i < rects.size(); i++) {
                const MapFile::Rect& img = rects[i];

                if (img.x < te.x && 
                    img.y < te.y &&
                    img.x + img.width > te.x && 
                    img.y + img.height > te.y) {

                    if ((best == -1 || rects[i].z < img.z) && i != _selectedRect)
                        best = i;
                }
            }

            if (best != -1) {
                _selectedRect = best;
                updatePropertiesGrid(best);
                return true;
            } else {
                return false;
            }
        }
    }

    bool RectangleTool::idleMouseMove(ToolEvent& te) {
        if (te.leftButton && _selectedRect != -1) {
            const MapFile::Rect& img = getMap()->_terrain.rects[_selectedRect];

            _state = MovingSelection;
            _x = te.x - img.x;
            _y = te.y - img.y;
            _x2 = img.x;
            _y2 = img.y;
            return true;
        } else {
            return false;
        }
    }

    bool RectangleTool::draggingNewMouseMove(ToolEvent& te) {
        _x2 = te.x;
        _y2 = te.y;
        return true;
    }

    bool RectangleTool::draggingNewMouseUp(ToolEvent& te) {
        float x = std::min(_x, te.x);
        float y = std::min(_y, te.y);
        float w = (_x > te.x) ? _x - te.x : te.x - _x;
        float h = (_y > te.y) ? _y - te.y : te.y - _y;

        te.cmd->handleCommand(new AddRectCommand(x, y, w, h));
        _state = Idle;
        return true;
    }

    void RectangleTool::updatePropertiesGrid(int index) {
        struct local {
            static const char* ftoa(float f) {
                static char blah[255];
                sprintf(blah, "%f", f);
                return blah;
            }
        };

        const MapFile::Rect& rect = getMap()->_terrain.rects[index];
        std::map<std::string, std::string> properties;

        properties["filename"] = rect.name;
        properties["x"] = local::ftoa(rect.x);
        properties["y"] = local::ftoa(rect.y);
        properties["width"] = local::ftoa(rect.width);
        properties["height"] = local::ftoa(rect.height);
        setPropertiesGrid(properties);
    }
}
