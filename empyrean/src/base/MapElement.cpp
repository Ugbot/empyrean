
#include "MapElement.h"
#include "MapVisitor.h"

namespace pyr {

    void GeometryElement::handleVisitor(MapVisitor& v) {
        v.visitGeometry(this);
    }

    void GeometryElement::calculateBounds() {
        float LARGE = 1000000;
        _min.set( LARGE,  LARGE);
        _max.set(-LARGE, -LARGE);
        for (size_t i = 0; i < triangles.size(); ++i) {
            for (int j = 0; j < 3; ++j) {
                Vec3f v = vertexArray->positions[triangles[i].pos[j]];
                _min[0] = std::min(_min[0], v[0]);
                _min[1] = std::min(_min[1], v[1]);
                _max[0] = std::max(_max[0], v[0]);
                _max[1] = std::max(_max[1], v[1]);
            }
        }
    }

    bool GeometryElement::visible(Vec2f ll, Vec2f ur) {
        for (int i = 0; i < 2; ++i) {
            if (_min[i] > ur[i] || _max[i] < ll[i]) {
                return false;
            }
        }
        return true;
    }
    
    void GroupElement::handleVisitor(MapVisitor& v) {
        v.visitGroup(this);
    }

    void DummyElement::handleVisitor(MapVisitor& v) {
        v.visitDummy(this);
    }
}
