#ifndef PYR_COLLIDER_H
#define PYR_COLLIDER_H

#include <map>
#include <vector>
#include "Constants.h"
#include "Types.h"
#include "VecMath.h"
#include "Utility.h"

namespace pyr {

    class Map;
    class Entity;

    struct Segment {
        Segment() {}
        Segment(const Vec2f& a, const Vec2f& b) {
            v1 = a;
            v2 = b;
        }

        Vec2f v1;
        Vec2f v2;
        Vec2f n;
    };

    struct CollisionData {
        Vec2f velocity;
        Vec2f displacement;
        Zeroed<float> time;
        collision::COLLISION_TYPE type;
    };

    CollisionData collideWithWorld(float dt, Entity* entity, const Map* terrain);
    CollisionData collideWithEntity(float dt, Entity* ent1, Entity* ent2);

    void resolveCollisionsAndMove(float dt, const Map* terrain, const std::vector<Entity*>& ents);
    void collideEntity(float dt, Entity* ent, const Map* terrain, const std::vector<Entity*>& ents, int depth);
}

#endif
