#include "Appearance.h"
#include "Behavior.h"
#include "Entity.h"


namespace pyr {

    // Destructor needs to be here so the ScopedPtr can delete a defined type.
    Entity::~Entity() {
    }

    void Entity::update(float dt, const Map* terrain) {
        if (_behavior) {
            _appearance->update(dt);
        }

        if (_appearance) {
            _appearance->update(dt);
        }
    }

}
