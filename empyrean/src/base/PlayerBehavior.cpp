#include "Collider.h"
#include "Constants.h"
#include "Entity.h"
#include "PlayerBehavior.h"
#include "VecMath.h"


namespace pyr {

    void PlayerBehavior::update(Entity* entity, float dt, const Map* map) {
        // Default behavior.
        Vec2f& pos = entity->getPos();
        Vec2f& vel = entity->getVel();
        Vec2f origPos = pos;

        pos += vel * dt;
        vel[1] -= 9.81f * dt;                      // gravity
        if (vel[1] < constants::TERMINAL_VELOCITY) { // terminal velocity
            vel[1] = constants::TERMINAL_VELOCITY;
        }

        collide(dt, origPos, pos, vel, entity->getBounds(), map);
    }

}
