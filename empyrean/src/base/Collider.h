#ifndef PYR_COLLIDER_H
#define PYR_COLLIDER_H

#include <map>
#include <vector>
#include "BoundingRectangle.h"
#include "CollisionBox.h"
#include "Types.h"
#include "VecMath.h"

namespace pyr {

    class Map;
    class Entity;

    struct CollisionData {
        std::vector<Segment> interesting;
        std::vector<Vec2f>   points;
    };

    CollisionData collideWithWorld(float dt, Entity* entity, const Map* terrain);

    void collideWithEntity(Entity* ent1, Entity* ent2);

    void resolveCollisions(float dt, Map* terrain, std::vector<Entity*>& ents);

}

#endif
