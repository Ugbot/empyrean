#ifndef PYR_COLLISION_BOX_H
#define PYR_COLLISION_BOX_H

#include "VecMath.h"

namespace pyr {

    struct Segment {
        Segment(const Vec2f& a, const Vec2f& b) {
            v1 = a;
            v2 = b;
        }

        Vec2f v1;
        Vec2f v2;
    };

    class CollisionBox {
    
    public:
        CollisionBox(const Vec2f& lowerLeft, const Vec2f& upperRight);
    
        const Vec2f& operator [] (int index) const;

        void getIntersectingSegs(std::vector<Segment>& interestingSegs, const std::vector<Segment>& segs);
    
        Vec2f getDisplacement(const std::vector<Segment>& segs);

        bool interestingSeg(const Segment& seg);

        void pointIntersect(std::vector<Vec2f>& points, const Segment& seg);

        bool segmentInside(const Segment& seg);

        bool pointInside(const Vec2f& pt);

    private:
        Vec2f   _verts[4];

    };
}
#endif
