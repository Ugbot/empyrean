#ifndef PYR_MAPOUTLINER_H
#define PYR_MAPOUTLINER_H

#include "MapVisitor.h"

namespace pyr {

    /**
     * Draws outlines around all the elements on the map.
     * This should eventually be able to only highlight a specific
     * element, or a specific element and all its children, or other
     * fun things to that effect.  Maybe there's a wizz-bang way to
     * decompose these behaviours and make it all sexy and parameterized.
     */
    class MapOutliner : public MapVisitor {
    public:
        virtual void visitGeometry(GeometryElement* e);
        virtual void visitGroup(GroupElement* e);
    };

}

#endif
