#include "Collider.h"
#include "Constants.h"
#include "ServerEntity.h"

namespace pyr {

    void DumbBehavior::update(ServerEntity* entity, float dt) {
        entity->getPos() += entity->getVel() * dt;

        entity->getVel()[0] += sin(angle) * dt / 2;
        entity->getVel()[1] += cos(angle) * dt / 2;
        angle += 3.1415627f * dt / 2;
    }

    void ServerEntity::update(float dt, Map* terrain) {
        if (_behavior) {
            _behavior->update(this, dt);
        } else {
            // Default behavior.
            Vec2f origPos = _pos;

            _pos += _vel * dt;
            _vel[1] -= 9.81f * dt;                       // gravity
            if(_vel[1] < constants::TERMINAL_VELOCITY) { // terminal velocity
                _vel[1] = constants::TERMINAL_VELOCITY;
            }

            float height = 1.9f;
            float width = 0.3f;

            collide(dt, origPos, _pos, _vel, width, height, terrain);
        }
   }

}
