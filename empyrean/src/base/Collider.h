#ifndef PYR_COLLIDER_H
#define PYR_COLLIDER_H

#include <vector>
#include "BoundingRectangle.h"
#include "CollisionBox.h"
#include "VecMath.h"

namespace pyr {

    class Map;

    struct CollisionData {
        std::vector<Segment> interesting;
        std::vector<Vec2f>   points;
    };

    CollisionData collide(float dt, const Vec2f& origPos, Vec2f& newPos, Vec2f& vel,
                          const BoundingRectangle& bounds, const Map* terrain);

    void collideWithEntity(Vec2f& entityPos, Vec2f& entityVel, const BoundingRectangle& bounds, 
                           Vec2f& otherPos, Vec2f& otherVel, const BoundingRectangle& otherBounds);
}

#endif
