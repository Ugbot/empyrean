#ifndef VIS_DEBUG_H
#define VIS_DEBUG_H

#include "Types.h"
#include "VecMath.h"
#include "Singleton.h"

namespace pyr {

    struct DebugRay {
        Vec2f pt1;
        Vec2f pt2;
        Vec3f color;
    };

    class VisDebug {
        PYR_DECLARE_SINGLETON(VisDebug);

        VisDebug() {;}
        ~VisDebug() {;}

    public:
        void addSegment(Vec2f pt1, Vec2f pt2, Vec3f color);
        void addPoint(Vec2f pt);

        std::vector<DebugRay>& getSegs();
        void clearSegs();
        std::vector<Vec2f>& getPts();
        void clearPts();

    private:
        std::vector<DebugRay> _debugRays;
        std::vector<Vec2f> _debugPts;
    };
};

#endif