#ifndef PYR_PHYSICS_ENGINE
#define PYR_PHYSICS_ENGINE

#include "Singleton.h"
#include "VecMath.h"

namespace pyr {

    class Entity;
    class Map;

    class PhysicsEngine {
        PYR_DECLARE_SINGLETON(PhysicsEngine);

    public:
        void moveEntities(float dt, const Map* map, const std::vector<Entity*>& entities);

    private:
        PhysicsEngine() {}
        ~PhysicsEngine() {}

        float getFrictionEffect(Entity* ent, float oldAccel);
        Vec2f getAccel(Entity* ent);
        void checkVelocity(Vec2f& newVel);
        float getBehaviorAccel(Entity* ent);
    };
}

#endif
