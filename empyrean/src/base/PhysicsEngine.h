#ifndef PYR_PHYSICS_ENGINE
#define PYR_PHYSICS_ENGINE

#include "Collider.h"

namespace pyr {

    class Map;
    class Entity;

    void moveEntities(float dt, const Map* map, const std::vector<Entity*>& entities, CollisionData& coldata);
}

#endif
