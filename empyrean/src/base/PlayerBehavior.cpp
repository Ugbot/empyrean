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
        _physics->desiredGroundSpeed = 2.0f;
    }

    void PlayerBehavior::update(Entity* entity, float dt, const Environment& env) {
        // Default behavior.
        Vec2f& pos = entity->getPos();
        Vec2f& vel = entity->getVel();
        const Vec2f origPos = pos;

        pos += vel * dt;
        vel[1] += -constants::GRAVITY * dt;                      // gravity

        const float mu = 0.8f;
        const float acc = -mu * constants::GRAVITY;

        if (_physics->desiredAccel[0] != 0) {
            vel[0] = _physics->desiredAccel[0];
        }

        if(!_physics->jumpNumber) {
            
            if(vel[0] > 0) {
                vel[0] += acc * dt;
                if(vel[0] < 0) {
                    vel[0] = 0;
                }
            }
            
            if(vel[0] < 0) {
                vel[0] -= acc * dt;
                if(vel[0] > 0) {
                    vel[0] = 0;
                }
            }                        
        }

        // This should probably go into physics.
        if (vel[1] < constants::TERMINAL_VELOCITY) { // terminal velocity
            vel[1] = constants::TERMINAL_VELOCITY;
        }
    }

    void PlayerBehavior::handleEvent(Entity* entity, const std::string& event) {
        const float jumpSpeed = 8;
        const float speed = 2;

        if (event == "Begin Right") {
            _physics->desiredAccel[0] = speed;
            _physics->facingRight = true;
            sendAppearanceCommand(entity, "Face Left");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "Begin Left") {
            _physics->desiredAccel[0] = -speed;
            _physics->facingRight = false;
            sendAppearanceCommand(entity, "Face Right");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "End Right" || event == "End Left") {
            _physics->desiredAccel[0] = 0;
            beginAnimationCycle(entity, "idle");
        }

        if (event == "Jump") {
            if (_physics->jumpNumber < 2) {
                entity->getVel()[1] = jumpSpeed;
                ++_physics->jumpNumber;
                beginAnimationCycle(entity, "strut");
            }
        }

        if (event == "Reset Jumping") {
            if(_physics->jumpNumber > 0) {
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
            }
            _physics->jumpNumber = 0;
        }

        if (event == "Attack") {
            beginAnimation(entity, "attack");
        }
    }
    
    bool PlayerBehavior::facingRight() const {
        return _physics->facingRight;
    }

}
