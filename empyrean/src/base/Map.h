#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include <string>
#include <map>
#include "MapElement.h"
#include "Utility.h"

namespace pyr {

    class Map {
    public:
        Map();

        GroupElementPtr getRoot() const;
        
    private:
        // The root should always be a GroupElement.  It's rather convenient
        // to be able to assume that the root has children.
        GroupElementPtr _root;
    };

}

#endif
