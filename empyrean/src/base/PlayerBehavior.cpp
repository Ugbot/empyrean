#include "Collider.h"
#include "Constants.h"
#include "Entity.h"
#include "PhysicsBehaviorSlot.h"
#include "PlayerBehavior.h"
#include "VecMath.h"


namespace pyr {

    PlayerBehavior::PlayerBehavior(const std::string& /*resource*/) {
        _physics = new PhysicsBehaviorSlot;
        setSlot(_physics.get());

        // We would like to be able to start in some sort of animation.
        //beginAnimationCycle("idle");
        _physics->desiredGroundSpeed = 3.0f;
        _physics->desiredAirSpeed = 4.0f;
        _physics->groundDir = Vec2f(1,0);
    }

    void PlayerBehavior::update(Entity* entity, float dt, const Environment& env) {
        // Reset Jumping if needed.
        if(_physics->jumpNumber > 0 && !_physics->inAir) {
            if(_physics->desiredAccel[0] > 0) {
                entity->sendAppearanceCommand("Face Right");
                entity->beginAnimationCycle("walk");
            }
            else if(_physics->desiredAccel[0] < 0) {
                entity->sendAppearanceCommand("Face Left");
                entity->beginAnimationCycle("walk");
            }
            else {
                entity->beginAnimationCycle("idle");
            }
            _physics->jumpNumber = 0;
        }
    }

    void PlayerBehavior::handleEvent(Entity* entity, const std::string& event) {
        const float jumpForce = 80;
        const float accel = 14;

        if (event == "Begin Right") {
            _physics->desiredAccel[0] = accel;
            _physics->desiredGroundSpeed = 3.0f;
            _physics->facingRight = true;
            entity->sendAppearanceCommand("Face Right");
            entity->beginAnimationCycle("walk");
        }

        if (event == "Begin Left") {
            _physics->desiredAccel[0] = -accel;
            _physics->desiredGroundSpeed = -3.0f;
            _physics->facingRight = false;
            entity->sendAppearanceCommand("Face Left");
            entity->beginAnimationCycle("walk");
        }

        if (event == "End Right" || event == "End Left") {
            _physics->desiredAccel[0] = 0;
            _physics->desiredGroundSpeed = 0.0f;
            entity->beginAnimationCycle("idle");
        }

        if (event == "Jump") {
            if (_physics->jumpNumber < 2) {
                //_physics->appliedForce = Vec2f(0,jumpForce);
                _physics->desiredAccel[1] = jumpForce/_physics->mass;
                ++_physics->jumpNumber;
                _physics->inAir = true;
                entity->beginAnimationCycle("strut");
            }
        }

        if (event == "Attack") {
            entity->beginAnimation("attack");
        }
    }
    
    bool PlayerBehavior::facingRight() const {
        return _physics->facingRight;
    }

}
