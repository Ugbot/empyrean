#include "Entity.h"


namespace pyr {

    void Entity::update(float dt, const Map* terrain) {
        _behavior->update(this, dt);
        _appearance->update(dt);
    }

}
