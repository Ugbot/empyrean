#ifndef PYR_COLLIDER_H
#define PYR_COLLIDER_H

#include <vector>
#include "CollisionBox.h"
#include "VecMath.h"

namespace pyr {

    class Map;

    struct CollisionData {
        std::vector<Segment> interesting;
        std::vector<Vec2f>   points;
    };

    CollisionData collide(const Vec2f& origPos, Vec2f& newPos, Vec2f& vel,
                          float width, float height, const Map* terrain);

}

#endif
