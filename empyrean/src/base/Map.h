#ifndef PYR_MAP_H
#define PYR_MAP_H


#include <vector>
#include <string>
#include <map>
#include "MapElement.h"
#include "Utility.h"

namespace pyr {

    class MapVisitor;

    class Map {
    public:
        Map() {
            _root = new GroupElement;
        }

        GroupElementPtr getRoot() const {
            return _root;
        }

        void handleVisitor(MapVisitor& visitor) const {
            getRoot()->handleVisitor(visitor);
        }
        
    private:
        // The root should always be a GroupElement.  It's rather convenient
        // to be able to assume that the root has children.
        GroupElementPtr _root;
    };

}

#endif
