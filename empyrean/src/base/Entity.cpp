#include "Collider.h"
#include "Entity.h"
#include "Environment.h"


namespace pyr {

    ActionQueue Entity::update(float dt, const Environment& env) {
        _behavior->update(this, dt, env);
        ActionQueue aq;
        _behavior->getActions(aq);  // This clears.
        return aq;
    }

    void Entity::setNextWithCurrent() {
        _nextPos = _pos;
        _nextVel = _vel;
    }

    void Entity::setCurrentWithNext() {
        _pos = _nextPos;
        _vel = _nextVel;
    }
}
