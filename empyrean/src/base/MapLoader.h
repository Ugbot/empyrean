#ifndef PYR_MAP_LOADER_H
#define PYR_MAP_LOADER_H


#include "Error.h"
#include "Types.h"


namespace pyr {
    class Map;

    PYR_DEFINE_RUNTIME_ERROR(LoadMapError);    

    /// Throws LoadMapError on failure.
    Map* loadMap(const string& filename);
}


#endif
