#ifndef PYR_CLIENT_ENTITY_H
#define PYR_CLIENT_ENTITY_H


#include <gmtl/Vec.h>
#include "Entity.h"
#include "Types.h"
#include "Utility.h"

namespace pyr {

    class Map;

    /// Represents a drawable, updateable object with a position and velocity.
    class ClientEntity : public Entity {
    public:
        ClientEntity(Behavior* behavior, Appearance* appearance)
            : Entity(behavior, appearance)
        {
        }

        void draw() {
            getAppearance()->draw();
        }
    };

}


#endif
