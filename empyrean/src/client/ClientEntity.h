#ifndef PYR_CLIENT_ENTITY_H
#define PYR_CLIENT_ENTITY_H

#include "ClientAppearance.h"
#include "Entity.h"

namespace pyr {

    class ClientEntity : public Entity {
    public:
        ClientEntity(Behavior* behavior, ClientAppearance* appearance)
            : Entity(behavior, appearance)
        {
        }

        /// Override update() so we can update the appearance.
        void update(float dt, const Map* map);
        void draw() const;

    private:
        /// We specified the appearance, so we know what type it is.
        ClientAppearance* getClientAppearance() const {
            return static_cast<ClientAppearance*>(getAppearance());
        }
    };

}

#endif
