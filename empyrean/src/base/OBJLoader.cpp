#include "Map.h"
#include "OBJLoader.h"


namespace pyr {

    Map* loadOBJ(const std::string& filename) {
        std::ifstream file(filename);
        if (!file) {
            return 0;
        }

        GeometryElementPtr elt = new GeometryElement;

        

        Map* map = new Map;
        map->getRoot()->children.push_back(elt);
        return map;
    }

}
