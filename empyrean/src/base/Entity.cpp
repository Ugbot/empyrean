#include "Collider.h"
#include "Entity.h"


namespace pyr {

    void Entity::update(float dt, const Environment& env) {
        _behavior->update(this, dt, env);
    }

    void Entity::collideWithOthers(EntityList entities) {
        // Proceed to collide with all other game entities
        EntityList::iterator itr = entities.begin();
        for (; itr != entities.end(); ++itr) {
            Entity* entity = *itr;
            if (entity != this) {
                collideWithEntity(
                    getPos(), getVel(), getBounds(),
                    entity->getPos(), entity->getVel(), entity->getBounds());
            }
        }
    }

}
