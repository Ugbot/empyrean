
#include "ObstructionTool.h"
#include "OpenGL.h"
#include "MapFile.h"
#include "MapView.h"
#include "AddObstructionPointCommand.h"
#include "AddObstructionSegmentCommand.h"

namespace pyr {
    ObstructionTool::ObstructionTool(MainFrame* mf)
        : Tool(mf)
    {
    }

    bool ObstructionTool::onLeftDown(ToolEvent& event) {
        if (event.ctrl) {
            // TODO: make sure there's no point already close by?
            event.cmd->handleCommand(new AddObstructionPointCommand(event.x, event.y));
            return true;
        } else if (event.shift) {
            int p = nearestPoint(event.x, event.y);
            if (canAddPoint(_curPoint, p)) {
                event.cmd->handleCommand(new AddObstructionSegmentCommand(_curPoint, p));
                return true;
            } else {
                return false;
            }
        } else {
            _curPoint = nearestPoint(event.x, event.y);
            return true;
        }
    }

    void ObstructionTool::onRender() {
        const MapFile::ObstructionMap& obs = getMap()->_obstructions;
        //                                             B     G     R     A
        const unsigned char UNSELECTED_COLOUR[] = {    0,    0, 0xFF, 0xFF };
        const unsigned char SELECTED_COLOUR[] =   { 0XFF, 0XFF, 0XFF, 0XFF };

        glPointSize(5);
        glEnable(GL_POINT_SMOOTH);
        glBegin(GL_POINTS);
        for (unsigned i = 0; i < obs.points.size(); i++) {
            const MapFile::Point& p = obs.points[i];

            // >:D
            glColor4ubv(const_cast<unsigned char*>((i == _curPoint) ? SELECTED_COLOUR : UNSELECTED_COLOUR));
            glVertex2f(p.x, p.y);
        }
        glEnd();
    }

    int ObstructionTool::nearestPoint(float x, float y) {
        int best = -1;
        float bestDistance = 9999999999.0f; // really really far away.

        const std::vector<MapFile::Point>& pts = getMap()->_obstructions.points;
        for (unsigned i = 0; i < pts.size(); i++) {
            float dx = x - pts[i].x;
            float dy = y - pts[i].y;

            // don't care about the exact value.  Just the relation.  Thus, sqrt() can go to hell.
            float distSquared = dx * dx + dy * dy;
            if (distSquared < bestDistance) {
                best = i;
                bestDistance = distSquared;
            }
        }

        return best;
    }

    bool ObstructionTool::canAddPoint(int a, int b) {
        const std::vector<MapFile::Point>& pts = getMap()->_obstructions.points;
        const std::vector<MapFile::Obstruction>& obs = getMap()->_obstructions.obstructions;

        if (a == b || a == -1 || b == -1)
            return false; // :P

        for (unsigned i = 0; i < obs.size(); i++) {
            if ((obs[i].p1 == a && obs[i].p2 == b) ||
                (obs[i].p1 == b && obs[i].p2 == a))
                return false;
        }

        return true;
    }
}
