#include "Collider.h"
#include "Constants.h"
#include "Entity.h"
#include "PlayerBehavior.h"
#include "VecMath.h"


namespace pyr {

    PlayerBehavior::PlayerBehavior(const std::string& /*resource*/) {
        // We would like to be able to start in some sort of animation.
        //beginAnimationCycle("idle");
        setDesiredGroundSpeed(2.0f);
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
        
        if(getDesiredAccel()[0] != 0) {
            vel[0] = getDesiredAccel()[0];
        }

        if(!getJumpNumber()) {
            
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
        const float speed = 2;
       
        if (event == "Begin Right") {
            getDesiredAccel()[0] = speed;
            setFacingRight(true);
            sendAppearanceCommand(entity, "Face Left");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "Begin Left") {
            getDesiredAccel()[0] = -speed;
            setFacingRight(false);
            sendAppearanceCommand(entity, "Face Right");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "End Right" || event == "End Left") {
            getDesiredAccel()[0] = 0;
            beginAnimationCycle(entity, "idle");
        }

        if (event == "Jump") {
            if (getJumpNumber() < 2) {
                entity->getVel()[1] = jumpSpeed;
                ++getJumping();
                beginAnimationCycle(entity, "strut");
            }
        }

        if (event == "Reset Jumping") {
            if(getJumpNumber() > 0) {
                if(getDesiredAccel()[0] > 0) {
                    sendAppearanceCommand(entity, "Face Left");
                    beginAnimationCycle(entity, "walk");
                }
                else if(getDesiredAccel()[0] < 0) {
                    sendAppearanceCommand(entity, "Face Right");
                    beginAnimationCycle(entity, "walk");
                }
                else {
                    beginAnimationCycle(entity, "idle");
                }
            }
            setJumpNumber(0);
        }

        if (event == "Attack") {
            beginAnimation(entity, "attack");
        }
    }

}
