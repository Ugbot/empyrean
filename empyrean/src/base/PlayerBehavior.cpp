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
                sendAppearanceCommand(entity, "Face Left");
                beginAnimationCycle(entity, "walk");
            }
            else if(_physics->desiredAccel[0] < 0) {
                sendAppearanceCommand(entity, "Face Right");
                beginAnimationCycle(entity, "walk");
            }
            else {
                beginAnimationCycle(entity, "idle");
            }
            _physics->jumpNumber = 0;
        }
    }

    void PlayerBehavior::handleEvent(Entity* entity, const std::string& event) {
        const float jumpForce = 160;
        const float accel = 9;

        if (event == "Begin Right") {
            _physics->desiredAccel[0] = accel;
            _physics->desiredGroundSpeed = 3.0f;
            _physics->facingRight = true;
            sendAppearanceCommand(entity, "Face Left");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "Begin Left") {
            _physics->desiredAccel[0] = -accel;
            _physics->desiredGroundSpeed = -3.0f;
            _physics->facingRight = false;
            sendAppearanceCommand(entity, "Face Right");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "End Right" || event == "End Left") {
            _physics->desiredAccel[0] = 0;
            _physics->desiredGroundSpeed = 0.0f;
            beginAnimationCycle(entity, "idle");
        }

        if (event == "Jump") {
            if (_physics->jumpNumber < 2) {
                //_physics->appliedForce = Vec2f(0,jumpForce);
                _physics->desiredAccel[1] = jumpForce/_physics->mass;
                ++_physics->jumpNumber;
                _physics->inAir = true;
                beginAnimationCycle(entity, "strut");
            }
        }

        if (event == "Attack") {
            beginAnimation(entity, "attack");
        }
    }
    
    bool PlayerBehavior::facingRight() const {
        return _physics->facingRight;
    }

}
