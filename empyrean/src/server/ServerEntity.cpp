#include "Collider.h"
#include "ServerEntity.h"

namespace pyr {

    void ServerEntity::update(float dt, Map* terrain) {

        Vec2f origPos = _pos;       // Save original position

        _pos += _vel * dt;
        _pos[1] = std::max(0.0f, _pos[1]); // collision detection
        _vel[1] -= 9.81f * dt;             // gravity

        float height = 1.9f;
        float width = 0.3f;

        collide(origPos, _pos, _vel, width, height, terrain);

    }

}
