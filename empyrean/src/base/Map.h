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

        void addElement(MapElementPtr e) {
            getRoot()->children.push_back(e);
        }

        void handleVisitor(MapVisitor& visitor) const {
            getRoot()->handleVisitor(visitor);
        }

        MapElementPtr findElementByName(const std::string& name) const;
        void getAllElements(std::vector<MapElementPtr>& elts) const;
        
    private:

        // The root should always be a GroupElement.  It's rather convenient
        // to be able to assume that the root has children.
        GroupElementPtr _root;
    };

}

#endif
