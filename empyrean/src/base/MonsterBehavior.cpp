#include "Collider.h"
#include "Constants.h"
#include "Entity.h"
#include "Environment.h"
#include "MonsterBehavior.h"
#include "PhysicsBehaviorSlot.h"

namespace pyr {

    float distance(const EntityPtr& a, const EntityPtr& b) {
        return length(a->getPos() - b->getPos());
    }

    MonsterBehavior::MonsterBehavior(const std::string& /*resource*/) {
        _physics = new PhysicsBehaviorSlot;
        setSlot(_physics);

        // We would like to be able to start in some sort of animation.
        //beginAnimationCycle("idle");
        _physics->desiredGroundSpeed = 1.5f;
        _physics->desiredAirSpeed    = 4.0f;
    }

    void MonsterBehavior::update(Entity* entity, float dt, const Environment& env) {
        // Customized behavior.
        EntityPtr closest = 0;
        for (size_t i = 0; i < env.entities.size(); ++i) {
            if (env.entities[i] != entity) {
                if (closest) {
                    if (distance(env.entities[i], entity) < distance(closest, entity)) {
                        closest = env.entities[i];
                    }
                } else {
                    closest = env.entities[i];
                }
            }
        }

        if (closest) {
            if (closest->getPos()[0] > entity->getPos()[0] + 1.0) {
                _physics->desiredAccel = Vec2f(1.0f,0.0f);
                _physics->facingRight = true;
                entity->sendAppearanceCommand("Face Left");
                entity->beginAnimationCycle("walk");                
            }
            else if (closest->getPos()[0] > entity->getPos()[0]) {
                _physics->desiredAccel = Vec2f(-1.0f,0.0f);
                _physics->facingRight = false;
                entity->sendAppearanceCommand("Face Right");
                entity->beginAnimationCycle("walk");
            }
            else if (closest->getPos()[0] < entity->getPos()[0] - 1.0) {
                _physics->desiredAccel = Vec2f(-1.0f,0.0f);
                _physics->facingRight = false;
                entity->sendAppearanceCommand("Face Right");
                entity->beginAnimationCycle("walk");
            }
            else if (closest->getPos()[0] < entity->getPos()[0]) {
                _physics->desiredAccel = Vec2f(1.0f,0.0f);
                _physics->facingRight = true;
                entity->sendAppearanceCommand("Face Left");
                entity->beginAnimationCycle("walk");                
            }
        }
    }

}
