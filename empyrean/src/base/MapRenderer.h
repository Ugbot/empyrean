#ifndef PYR_MAPRENDERER_H
#define PYR_MAPRENDERER_H

#include "MapVisitor.h"

namespace pyr {
    
    class MapRenderer : public MapVisitor {
    public:
        virtual void visitGroup(GroupElement* e);
        virtual void visitGeometry(GeometryElement* e);
    };

}

#endif