#ifndef PYR_SERVER_ENTITY_H
#define PYR_SERVER_ENTITY_H

#include <algorithm>
#include <string>
#include "Database.h"
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
        ServerEntity(u16 id, Behavior* behavior, ServerAppearance* appearance, CharacterPtr character)
            : Entity(behavior, appearance)
        {
            _id = id;
            _character = character;
        }

        u16 getID() const {
            return _id;
        }

        ServerAppearance* getServerAppearance() const {
            // Since we created the base class, we know what
            // type of appearance it has.
            return static_cast<ServerAppearance*>(getAppearance());
        }

        CharacterPtr getCharacter() const {
            return _character;
        }

    private:
        u16 _id;
        CharacterPtr _character;
    };
    
}

#endif
