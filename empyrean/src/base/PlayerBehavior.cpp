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
        if (vel[1] < constants::TERMINAL_VELOCITY) { // terminal velocity
            vel[1] = constants::TERMINAL_VELOCITY;
        }

        // For testing to see if jumping is done.
        const Vec2f precollidePosition = pos;
        const Vec2f precollideVelocity = vel;

        /// @todo Save the collision data for debugging.
        collide(dt, origPos, pos, vel, entity->getBounds(), env.map);

        const int FALLING_SPEED = 0;

        // If you are higher than you once were so you were forced up and you were falling
        // (before the collision) This means that you hit a surface below you so therefore
        // reset jumping
        if (precollidePosition[1] < pos[1] &&
            precollideVelocity[1] < FALLING_SPEED) {
             _jumping = 0;
             if (entity->getVel()[0] == 0) {
                beginAnimationCycle(entity, "idle");
             } else {
                beginAnimationCycle(entity, "walk");
             }
        }
    }

    void PlayerBehavior::handleEvent(Entity* entity, const std::string& event) {
        const float jumpSpeed = 8;
        const float speed = 2;

        if (event == "Begin Right") {
            entity->getVel()[0] = speed;
            sendAppearanceCommand(entity, "Face Left");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "Begin Left") {
            entity->getVel()[0] = -speed;
            sendAppearanceCommand(entity, "Face Right");
            beginAnimationCycle(entity, "walk");
        }

        if (event == "End Right" || event == "End Left") {
            entity->getVel()[0] = 0;
            beginAnimationCycle(entity, "idle");
        }

        if (event == "Jump") {
            if (_jumping < 2) {
                entity->getVel()[1] = jumpSpeed;
                ++_jumping;
                beginAnimationCycle(entity, "strut");
            }
        }

        if (event == "Attack") {
            beginAnimation(entity, "attack");
        }
    }

}
