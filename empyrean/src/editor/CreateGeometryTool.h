#ifndef PYR_CREATE_GEOMETRY_TOOL_H
#define PYR_CREATE_GEOMETRY_TOOL_H


#include "GLUtility.h"
#include "MapView.h"
#include "Tool.h"


namespace pyr {

    class CreateGeometryTool : public Tool {
    public:
        CreateGeometryTool() {
            _down = false;
        }
        
        bool onMouseMove(ToolEvent& event) {
            if (_down) {
                _last = event.mapPos;
                return true;
            } else {
                return false;
            }
        }
        
        bool onLeftDown(ToolEvent& event) {
            _down = true;
            _last = event.mapPos;
            return true;
        }
        
        bool onLeftUp(ToolEvent& event) {
            if (_down) {
                _down = false;
                _points.push_back(_last);
                return true;
            } else {
                return false;
            }
        }
        
        bool onRightDown(ToolEvent& event) {
            if (_down) {
                return false;
            } else {
                /*GeometryElementPtr elt = new GeometryElement;
                elt->texture = "images/pointer.png";
                
                
                MapElementPtr parent = getMap()->getRoot();
                event.cmd->handleCommand(
                    new CreateMapElementCommand(elt, parent));*/
            }
        }
        
        void onRender() {
            // draw segments
            glColor3f(1, 0, 1);
            glBegin(GL_LINE_LOOP);
            for (size_t i = 0; i < _points.size(); ++i) {
                glVertex(_points[i]);
            }
            if (_down) {
                glVertex(_last);
            }
            glEnd();
            
            // draw vertices
            glColor3f(1, 1, 0);
            glBegin(GL_POINTS);
            for (size_t i = 0; i < _points.size(); ++i) {
                glVertex(_points[i]);
            }
            if (_down) {
                glVertex(_last);
            }
            glEnd();
        }
        
    private:
        bool _down;
        std::vector<Vec2f> _points;
        Vec2f _last;
    };

}


#endif
