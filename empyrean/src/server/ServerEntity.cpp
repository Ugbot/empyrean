#include "Collider.h"
#include "Constants.h"
#include "ServerEntity.h"

namespace pyr {

/*
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

            collide(dt, origPos, _pos, _vel, _width, _height, terrain);
        }
    }
*/

   void ServerEntity::collideWithOthers(std::vector<ServerEntity*>& entities) {
#if 0
       // Proceed to collide with all other game entities
        for (size_t i = 0; i < entities.size(); ++i) {
            if(entities[i]->getPos() != getPos()) { // if the entities aren't in the same exact position
                collideWithEntity(getPos(), getVel(), getWidth(), getHeight(), 
                        entities[i]->getPos(), entities[i]->getVel(), entities[i]->getWidth(),entities[i]->getHeight());
            }
        }
#endif
   }

}
