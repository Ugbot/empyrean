#ifndef PYR_OBJ_LOADER_H
#define PYR_OBJ_LOADER_H

#include <string>

namespace pyr {

    class Map;

    Map* loadOBJFile(const std::string& filename);

}

#endif
