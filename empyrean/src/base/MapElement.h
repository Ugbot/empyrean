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

    /**
     * This statement may be false: entities, triggers, obstructions
     * should all inherit from MapElement.
     */    
    class MapElement : public RefCounted {
    protected:
        ~MapElement() {}

    public:
        Vec2f pos;

        /**
         * Allows more convenient syntax when creating MapVisitors on
         * the stack.  i.e. nameless temporaries
         */
        virtual void handleVisitor(MapVisitor& v) = 0;
    };
    typedef RefPtr<MapElement> MapElementPtr;


    class GeometryElement : public MapElement {
    protected:
        ~GeometryElement() { }

    public:
        typedef Vec3f Vertex;
        typedef Vec3i Triangle;

        //PlanarMap geometry;
        MaterialPtr material;

        std::vector<Vertex> vertices;
        std::vector<Triangle> triangles;

        virtual void handleVisitor(MapVisitor& v);
    };
    typedef RefPtr<GeometryElement> GeometryElementPtr;


    /**
     * This statement may be false: Render state changing nodes should
     * inherit GroupElement.
     */
    class GroupElement : public MapElement {
    public:
        std::vector<MapElementPtr> children;
    
        virtual void handleVisitor(MapVisitor& v);
    };
    typedef RefPtr<GroupElement> GroupElementPtr;

}

#endif
