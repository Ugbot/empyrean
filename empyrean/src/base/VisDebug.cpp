#include "VisDebug.h"
#include "GLUtility.h"
#include "OpenGL.h"

namespace pyr {
    PYR_DEFINE_SINGLETON(VisDebug);

    void VisDebug::addSegment(Vec2f pt1, Vec2f pt2, Vec3f color) {
        DebugRay dray;
        dray.pt1 = pt1;
        dray.pt2 = pt2;
        dray.color = color;
        _debugRays.push_back(dray);
    }

    void VisDebug::addPoint(Vec2f pt) {
        _debugPts.push_back(pt);
    }

    std::vector<DebugRay>& VisDebug::getSegs() {
        return _debugRays;
    }

    void VisDebug::clearSegs() {
        _debugRays.clear();
    }

    std::vector<Vec2f>& VisDebug::getPts() {
        return _debugPts;
    }

    void VisDebug::clearPts() {
        _debugPts.clear();
    }
};