#include "Map.h"


namespace pyr {

    Map::Map()
        : _root(new GroupElement)
    {}

    GroupElementPtr Map::getRoot() const {
        return _root;
    }
}
