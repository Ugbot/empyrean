#ifndef PYR_SERVER_ENTITY_H
#define PYR_SERVER_ENTITY_H

#include <algorithm>
#include <string>
#include "Entity.h"
#include "ScopedPtr.h"
#include "Types.h"
#include "Utility.h"
#include "VecMath.h"

namespace pyr {

    class Appearance;
    class Behavior;
    class Map;

    class ServerEntity : public Entity {
    public:
        ServerEntity(u16 id, Behavior* behavior, Appearance* appearance)
            : Entity(behavior, appearance), _id(id)
        {
        }

        u16 getID() const {
            return _id;
        }

    private:
        u16 _id;
    };
    
}

#endif
