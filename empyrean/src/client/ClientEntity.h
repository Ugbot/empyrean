#ifndef PYR_CLIENT_ENTITY_H
#define PYR_CLIENT_ENTITY_H

#include "Entity.h"

namespace pyr {

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
