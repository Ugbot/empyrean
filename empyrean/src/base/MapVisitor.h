#ifndef PYR_MAPVISITOR_H
#define PYR_MAPVISITOR_H

namespace pyr {

    class MapElement;
    class GroupElement;
    class GeometryElement;

    class MapVisitor {
    public:
        virtual void visitGroup(GroupElement* e) = 0;
        virtual void visitGeometry(GeometryElement* e) = 0;
    };

}

#endif