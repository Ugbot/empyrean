#include "Collider.h"
#include "Entity.h"


namespace pyr {

    ActionQueue Entity::update(float dt, const Environment& env) {
        _behavior->update(this, dt, env);
        ActionQueue aq;
        _behavior->getActions(aq);  // This clears.
        return aq;
    }

}
