#include "Entity.h"


namespace pyr {

    void Entity::update(float dt, const Map* map) {
        _behavior->update(this, dt, map);
        _appearance->update(dt);
    }

}
