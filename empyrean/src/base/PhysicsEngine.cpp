#include "Behavior.h"
//#include "Collider.h"
#include "Entity.h"
#include "Map.h"
#include "PhysicsBehaviorSlot.h"
#include "PhysicsEngine.h"
#include "PlayerBehavior.h"
//#include "VisDebug.h"

namespace pyr {

    void checkVelocity(Vec2f& newVel, PhysicsBehaviorSlot* p) {
        // Set velocity to zero if it is small to stop friction
        float normalSettle = 0.05f;
        if(gmtl::lengthSquared(p->desiredAccel) == 0 && !p->inAir) {
            normalSettle = 0.5f;
        }

        if (fabs(newVel[0]) < normalSettle) {
                newVel[0] = 0.0f;
        }
        if (fabs(newVel[1]) < normalSettle) {
                newVel[1] = 0.0f;
        }
    }

    Vec2f getFrictionEffect(Entity* ent, PhysicsBehaviorSlot* p, Vec2f prevAccel) {
        // If on the ground ..
        if (!p->inAir) {
            // TEMP!!!!!  locally define mu - eventually get this from the MAP!
            const float muk = 0.8f;
            const float mus = 0.8f;

            // Get the angle between the ground and the velocity
            Vec2f vel = ent->getNextVel();
            float cosVelToGround = gmtl::dot(p->groundDir,vel) / gmtl::length(vel);
            
            // Get the angle between gravity and the ground normal
            float cosGravToNorm = gmtl::dot(-p->groundNorm,Vec2f(0,-1));

            // See if we are not moving (vel perpendicular to ground)
            if ( cosVelToGround == 0) {
                return Vec2f(0.0f,0.0f);
            }
            else {
                // See if we are not moving fast enough to overcome static friction
                float accelComp = gmtl::length(prevAccel) * cosVelToGround;
                if (fabs(accelComp) <= mus*constants::GRAVITY) {
                    // Stop moving ...
                    ent->setNextVel(Vec2f(0,0));
                    return -prevAccel;
                }
                else {
                    // we are moving so the friction is kinematic
                    float frictionComp = -sgn(cosVelToGround) * muk * constants::GRAVITY * cosGravToNorm;
                    return p->groundDir * frictionComp;
                }
            }
        }

        // Or in the air
        else {
            const float airRes = 0.01f;
            return Vec2f(-sgn(ent->getVel()[0])*airRes,0.0f);
        }
    }

    Vec2f getBehaviorAccel(Entity* ent, PhysicsBehaviorSlot* p) {
        Vec2f vel = ent->getNextVel();
      
        // DETERMINE THE ACCELERATION PARALLEL TO GROUND
        // If the entity's velocity along the ground is along the same direction and greater than desired max, 
        // apply no acceleration in the same direction
        Vec2f accelGroundParallel(0.0f, 0.0f);
        if (p->desiredAccel[0] != 0) {
            if (vel[0]*p->desiredGroundSpeed > 0 && fabs(vel[0]) >= fabs(p->desiredGroundSpeed)) {
                accelGroundParallel = Vec2f(0.0f,0.0f);
            }
            else {
                accelGroundParallel = Vec2f(p->desiredAccel[0],0.0f);
            }
        }

        // DETERMINE THE ACCELERATION NORMAL TO GROUND
        // This is the part that handles jumping.
        Vec2f accelGroundNormal(0.0f, 0.0f);
        if (p->desiredAccel[1] != 0) {
            p->inAir = true;

            //float cosVelToGndNorm = gmtl::dot(p->groundNorm,vel) / gmtl::length(vel);
            float airSpeed = vel[1];//gmtl::length(vel)*cosVelToGndNorm;

            // See if the jump is over - that is the character has gotten the desired upward speed
            if (airSpeed*p->desiredAirSpeed > 0 && fabs(airSpeed) >= fabs(p->desiredAirSpeed)) {
                p->desiredAccel[1] = 0; // kill the jump
            }
            else {
                // Determine the acceleration normal to the ground
                accelGroundNormal = Vec2f(0,p->desiredAccel[1]);//p->groundNorm * p->desiredAccel[1];
            }
        }

        // Return the aggregate desired accel
        return accelGroundParallel + accelGroundNormal;
    }

    Vec2f getAccel(Entity* ent) {
        
        PhysicsBehaviorSlot* p = ent->getBehavior()->getSlot<PhysicsBehaviorSlot>();
        PYR_ASSERT(p,"Passed a non-physics entity to getAccel in PhysicsEngine.cpp");

        // Get the desired acceleration
        Vec2f accel = getBehaviorAccel(ent,p); 
        
        // Add in gravity effect
        accel += Vec2f(0.0f,-constants::GRAVITY);
        
        // Add in friction
        accel += getFrictionEffect(ent,p,accel);

        // Finally add in the applied force (as an acceleration)
        accel += p->appliedForce/p->mass;
        p->appliedForce = Vec2f(0.0f, 0.0f);


        return accel;
    }

    void moveEntities(float dt, const Map* map, const std::vector<Entity*>& entities, CollisionData& coldata) {
                
        // Do not affect "non-physics" entities
        std::vector<Entity*> physicsEntities;
        for (size_t i=0; i<entities.size(); ++i) {
            if (entities[i]->getBehavior()->getSlot<PhysicsBehaviorSlot>()) {
                physicsEntities.push_back(entities[i]);
            }
        }

        Vec2f newVel;
        for (size_t i=0; i < physicsEntities.size(); ++i) {
            PhysicsBehaviorSlot* phys = physicsEntities[i]->getBehavior()->getSlot<PhysicsBehaviorSlot>();
            physicsEntities[i]->setNextWithCurrent();
            newVel = physicsEntities[i]->getVel() + getAccel(physicsEntities[i]) * dt;
            checkVelocity(newVel, phys);
            physicsEntities[i]->setNextVel(newVel);
            phys->inAir = true;
            //the<VisDebug>().addSegment(physicsEntities[i]->getPos(),physicsEntities[i]->getPos() + physicsEntities[i]->getVel() * dt, Vec3f(1,0,1));            
        }

        // Find collisions for all entities, and find out where they need to move (by setting next pos)
        resolveCollisionsAndMove(dt,map,physicsEntities);

        // Officially move the entities by making their next positions the current ones, this is needed to 
        // ensure that all entities collide against the same setup.
        for (size_t i=0; i < physicsEntities.size(); ++i) {
            physicsEntities[i]->setCurrentWithNext();
            //the<VisDebug>().addSegment(physicsEntities[i]->getPos(),physicsEntities[i]->getPos() + physicsEntities[i]->getVel() * dt, Vec3f(0,0,0.5));
        }
    }
}
