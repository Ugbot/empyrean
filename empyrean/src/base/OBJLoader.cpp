#include <fstream>
#include <sstream>
#include "Map.h"
#include "OBJLoader.h"


namespace pyr {

    Map* loadOBJFile(const std::string& filename) {
        std::ifstream file(filename.c_str());
        if (!file) {
            return 0;
        }

        GeometryElementPtr elt = new GeometryElement;
        
        std::string line;
        while (getline(file, line)) {
            std::stringstream ss(line);

            std::string command;
            if (ss >> command) {
                if (command == "v") {
                    float x, y, z;
                    if (ss >> x >> y >> z) {
                        // notice: convert from max coordinates to empyrean coordinates here
                        elt->vertices.push_back(GeometryElement::Vertex(x, z, y));
                    }
                } else if (command == "f") {
                    std::string si, sj, sk;
                    if (ss >> si >> sj >> sk) {
                        // hack off texture coords and normals because we don't need them for now
                        int i = std::max(0, atoi(si.c_str()) - 1);
                        int j = std::max(0, atoi(sj.c_str()) - 1);
                        int k = std::max(0, atoi(sk.c_str()) - 1);

                        int nverts = int(elt->vertices.size());
                        if (i < nverts && j < nverts && k < nverts) {
                            elt->triangles.push_back(GeometryElement::Triangle(i, j, k));
                        }
                    }
                }
            }
        }


        Map* map = new Map;
        map->getRoot()->children.push_back(elt);
        return map;
    }

}
