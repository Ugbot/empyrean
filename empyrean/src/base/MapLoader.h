#ifndef PYR_MAP_LOADER_H
#define PYR_MAP_LOADER_H


#include "Error.h"
#include "Map.h"
#include "Types.h"


namespace pyr {
    PYR_DEFINE_RUNTIME_ERROR(LoadMapError);    

    /// Throws LoadMapError on failure.
    MapPtr loadMap(const string& filename);
}


#endif
