#include "MapFile.h"
#include "OpenGL.h"

#include "MapElement.h"

namespace pyr {

    Map::Map()
        : _root(new GroupElement)
    {}

    Map::~Map() {
        ;
    }

    RefPtr<GroupElement> Map::getRoot() const {
        return _root;
    }
}
