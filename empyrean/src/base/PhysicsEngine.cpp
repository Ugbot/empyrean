#include "Behavior.h"
#include "Collider.h"
#include "Entity.h"
#include "Map.h"
#include "PhysicsEngine.h"
#include "PlayerBehavior.h"

namespace pyr {
    PYR_DEFINE_SINGLETON(PhysicsEngine);

    void PhysicsEngine::moveEntities(float dt, const Map* map, const std::vector<Entity*>& entities) {
        
        // Find collisions for all entities
        resolveCollisions(dt,map,entities);

        // Determine the current velocity for this frame (considering changes due
        // to collisions) and move them.
        Vec2f newVel;
        for (size_t i=0; i < entities.size(); ++i) {
            newVel = entities[i]->getVel() + getAccel(entities[i]) * dt;
            checkVelocity(newVel);
            entities[i]->setPos( entities[i]->getPos() + dt*newVel );
        }
    }

    void PhysicsEngine::checkVelocity(Vec2f& newVel) {
        // Set velocity to zero if it is small to stop friction
        if (abs(newVel[0]) < 0.05 && abs(newVel[1]) < 0.05) {
                newVel[0] = 0.0f;
                newVel[1] = 0.0f;
        }
    }

    int getJumpNumber(const Behavior* b) {
        if (const PhysicsBehavior* p = dynamic_cast<const PhysicsBehavior*>(b)) {
            return p->getJumpNumber();
        } else {
            return 0;
        }
    }

    float getDesiredGroundSpeed(const Behavior* b) {
        if (const PhysicsBehavior* p = dynamic_cast<const PhysicsBehavior*>(b)) {
            return p->getDesiredGroundSpeed();
        } else {
            return 0;
        }
    }

    Vec2f getDesiredAccel(const Behavior* b) {
        if (const PhysicsBehavior* p = dynamic_cast<const PhysicsBehavior*>(b)) {
            return p->getDesiredAccel();
        } else {
            return Vec2f();
        }
    }

    Vec2f PhysicsEngine::getAccel(Entity* ent) {
        const float airRes = 0.01f;

        Vec2f accel;

        // If the entity is on the ground use these equations 
        if (getJumpNumber(ent->getBehavior()) == 0) {
            // Determine vector with x' along ground angle, y' along ground normal without friction
            accel[0] = getBehaviorAccel(ent) - constants::GRAVITY*sin(ent->getAngleWithGround());
            accel[0] += getFrictionEffect(ent,accel[0]);
            accel[1] = 0.0f;

            // Convert the acceleration back to world coordinates
            rotateVector(ent->getAngleWithGround(),accel);
        }
        // Otherwise use the equations for air movement
        else {
            accel[0] = -airRes; // + THRUST
            accel[1] = -constants::GRAVITY; // + LIFT
        }

        return accel;
    }

    float PhysicsEngine::getFrictionEffect(Entity* ent, float oldAccel) {
        // TEMP!!!!!  locally define mu - eventually get this from the MAP!
        const float mus = 0.75f;
        const float muk = 0.08f;

        Vec2f velAlongGround = ent->getVel();
        rotateVector(-ent->getAngleWithGround(),velAlongGround);
        float frictionAccel = 0.0f;

        if ( velAlongGround[0] == 0) {
            // see if it is kinematic friction
            if (abs(oldAccel) > mus*cos(ent->getAngleWithGround())*constants::GRAVITY) {
                frictionAccel = -sgn(velAlongGround[0])*muk*cos(ent->getAngleWithGround())*constants::GRAVITY;
            }
            // it is static friction
            else {
                frictionAccel = -oldAccel;
            }
        }
        // we are moving so the friction is kinematic
        else {
            frictionAccel = -sgn(velAlongGround[0])*muk*cos(ent->getAngleWithGround())*constants::GRAVITY;
        }

        return frictionAccel;
    }

    float PhysicsEngine::getBehaviorAccel(Entity* ent) {
        float behaviorVelComp = getDesiredGroundSpeed(ent->getBehavior());
        Vec2f velAlongGround = ent->getVel();
        rotateVector(-ent->getAngleWithGround(),velAlongGround);

        // If the entity's velocity is greater than desired max, apply no force in the same direction
        if (velAlongGround[0]*behaviorVelComp > 0 && velAlongGround[0] > behaviorVelComp) {
            return 0.0f;
        }
        else {
            return getDesiredAccel(ent->getBehavior())[0];
        }
    }
}
