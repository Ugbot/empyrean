#include "Collider.h"
#include "Entity.h"


namespace pyr {

    void Entity::update(float dt, const Environment& env) {
        _behavior->update(this, dt, env);
    }

}
