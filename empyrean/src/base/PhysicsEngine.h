#ifndef PYR_PHYSICS_ENGINE
#define PYR_PHYSICS_ENGINE

#include "Singleton.h"
#include "VecMath.h"

namespace pyr {

    struct Environment;
    class Entity;

    class PhysicsEngine {
        PYR_DECLARE_SINGLETON(PhysicsEngine);

    public:
        void moveEntities(float dt, Environment& env);

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