
#include "MapElement.h"
#include "MapVisitor.h"

namespace pyr {

    void GeometryElement::handleVisitor(MapVisitor& v) {
        v.visitGeometry(this);
    }
    
    void GroupElement::handleVisitor(MapVisitor& v) {
        v.visitGroup(this);
    }
}
