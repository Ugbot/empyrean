#include "Collider.h"
#include "Constants.h"
#include "Entity.h"
#include "PlayerBehavior.h"
#include "VecMath.h"


namespace pyr {

    PlayerBehavior::PlayerBehavior(const std::string& /*resource*/) {
        // We would like to be able to start in some sort of animation.
        //beginAnimationCycle("idle");
    }

    void PlayerBehavior::update(Entity* entity, float dt, const Environment& env) {
        // Default behavior.
        Vec2f& pos = entity->getPos();
        Vec2f& vel = entity->getVel();
        const Vec2f origPos = pos;

        pos += vel * dt;
        vel[1] += constants::GRAVITY * dt;                      // gravity

        const float mu = 0.8f;
        const float acc = mu * constants::GRAVITY;
        
        if(_desiredVelocity != 0) {
            vel[0] = _desiredVelocity;
        }

        if(!_jumping) {
            
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

        if (vel[1] < constants::TERMINAL_VELOCITY) { // terminal velocity
            vel[1] = constants::TERMINAL_VELOCITY;
        }

    }

    void PlayerBehavior::handleEvent(Entity* entity, const std::string& event) {
        const float jumpSpeed = 8;
        const float speed = 3;
       
        if (event == "Begin Right") {
            _desiredVelocity = speed;
            _facingRight = true;
            sendAppearanceCommand(entity, "Face Left");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "Begin Left") {
            _desiredVelocity = -speed;
            _facingRight = false;
            sendAppearanceCommand(entity, "Face Right");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "End Right" || event == "End Left") {
            _desiredVelocity = 0;
            beginAnimationCycle(entity, "idle");
        }

        if (event == "Jump") {
            if (_jumping < 2) {
                entity->getVel()[1] = jumpSpeed;
                ++_jumping;
                beginAnimationCycle(entity, "strut");
            }
        }

        if (event == "Reset Jumping") {
            if(_jumping > 0) {
                if(_desiredVelocity > 0) {
                    sendAppearanceCommand(entity, "Face Left");
                    beginAnimationCycle(entity, "walk");
                }
                else if(_desiredVelocity < 0) {
                    sendAppearanceCommand(entity, "Face Right");
                    beginAnimationCycle(entity, "walk");
                }
                else {
                    beginAnimationCycle(entity, "idle");
                }
            }
            _jumping = 0;
        }

        if (event == "Attack") {
            beginAnimation(entity, "attack");
        }
    }

}
