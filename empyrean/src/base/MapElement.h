#ifndef PYR_MAP_ELEMENT_H
#define PYR_MAP_ELEMENT_H


#include <string>
#include <vector>
#include <gmtl/Vec.h>
#include "Material.h"
#include "PlanarMap.h"
#include "RefCounted.h"
#include "RefPtr.h"
#include "VecMath.h"


namespace pyr {

    class MapVisitor;

    /// entities, triggers, obstructions should all inherit MapElement
    class MapElement : public RefCounted {
    protected:
        ~MapElement() {}

    public:
        Vec2f pos;

        // Allows more convenient syntax when creating MapVisitors on the stack.
        // ie. nameless temporaries.
        virtual void handleVisitor(MapVisitor& v) = 0;
    };
    typedef RefPtr<MapElement> MapElementPtr;


    class GeometryElement : public MapElement {
    protected:
        ~GeometryElement() { }

    public:
        PlanarMap geometry;
        MaterialPtr material;

        virtual void handleVisitor(MapVisitor& v);
    };
    typedef RefPtr<GeometryElement> GeometryElementPtr;


    /// Render state changing nodes should inherit GroupElement.
    class GroupElement : public MapElement {
    public:
        std::vector<MapElementPtr> children;
    
        virtual void handleVisitor(MapVisitor& v);
    };
    typedef RefPtr<GroupElement> GroupElementPtr;

}

#endif
