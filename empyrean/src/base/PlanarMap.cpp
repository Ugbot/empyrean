#include "PlanarMap.h"


namespace pyr {

    void PlanarMap::addFace(const std::vector<Vec2f>& points) {
        _vertices.resize(points.size());
        for (size_t i = 0; i < points.size(); ++i) {
            _vertices[i].pos = points[i];
        }
    }

}
