#ifndef PYR_MAP_LOADER_H
#define PYR_MAP_LOADER_H


#include <string>


namespace pyr {
    class Map;

    Map* loadMap(const std::string& filename);
}


#endif
