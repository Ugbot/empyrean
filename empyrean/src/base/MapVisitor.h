#ifndef PYR_MAPVISITOR_H
#define PYR_MAPVISITOR_H

namespace pyr {

    class DummyElement;
    class GeometryElement;
    class GroupElement;

    class MapVisitor {
    public:
        virtual void visitDummy(DummyElement* e) { }
        virtual void visitGeometry(GeometryElement* e) { };
        virtual void visitGroup(GroupElement* e) { };
    };

}

#endif
