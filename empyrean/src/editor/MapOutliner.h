#ifndef PYR_MAPOUTLINER_H
#define PYR_MAPOUTLINER_H

#include "MapVisitor.h"

namespace pyr {

    class MapOutliner : public MapVisitor {
    public:
        virtual void visitGeometry(GeometryElement* e);
        virtual void visitGroup(GroupElement* e);
    };

}

#endif