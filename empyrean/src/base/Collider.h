#ifndef PYR_COLLIDER_H
#define PYR_COLLIDER_H

#include <map>
#include <vector>
#include "Constants.h"
#include "Types.h"
#include "VecMath.h"

namespace pyr {

    class Map;
    class Entity;

    struct Segment {
        Segment(const Vec2f& a, const Vec2f& b) {
            v1 = a;
            v2 = b;
        }

        Vec2f v1;
        Vec2f v2;
    };

    struct CollisionData {
        std::vector<Segment> interesting;
        std::vector<Vec2f>   points;
    };

    CollisionData collideWithWorld(float dt, Entity* entity, const Map* terrain);

    void collideWithEntity(Entity* ent1, Entity* ent2);

    void resolveCollisions(float dt, const Map* terrain, std::vector<Entity*>& ents);

}

#endif
