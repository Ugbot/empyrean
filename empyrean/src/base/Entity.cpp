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

    void Entity::sendAppearanceCommand(const std::string& command) {
        getAppearance()->sendCommand(command);
    }

    void Entity::beginAnimationCycle(const std::string& animation) {
        getAppearance()->beginAnimationCycle(animation);
    }

    void Entity::beginAnimation(const std::string& animation) {
        getAppearance()->beginAnimation(animation);
    }

}
