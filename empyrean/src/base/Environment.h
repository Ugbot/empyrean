#ifndef PYR_ENVIRONMENT_H
#define PYR_ENVIRONMENT_H

#include <vector>
#include "Entity.h"
#include "Map.h"

namespace pyr {

    typedef std::vector<EntityPtr> EntityList;

    /**
     * Represents the read-only surroundings of an entity, passed into
     * Behavior's update() so it can use information from the map and
     * nearby typedef.  
     */
    struct Environment {
        MapPtr map;
        EntityList entities;
    };

}

#endif
