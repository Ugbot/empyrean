#ifndef PYR_SERVER_ENTITY_H
#define PYR_SERVER_ENTITY_H

#include <algorithm>
#include <string>
#include "Behavior.h"
#include "Entity.h"
#include "ScopedPtr.h"
#include "Types.h"
#include "Utility.h"
#include "VecMath.h"

namespace pyr {

    class Map;
    class ServerEntity;

    class ServerEntity : public Entity {
    public:
        ServerEntity(u16 id, const std::string& appearance, Behavior* behavior = 0) {
            _id = id;
            _appearance = appearance;
            _behavior = behavior;
        }

        u16 getID() const {
            return _id;
        }

        std::string getAppearance() const {
            return _appearance;
        }

        //void update(float dt, Map* terrain);
        void collideWithOthers(std::vector<ServerEntity*>& entities);

    private:
        u16 _id;
        std::string _appearance;
        ScopedPtr<Behavior> _behavior;
    };
    
}

#endif
