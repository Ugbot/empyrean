#ifndef PYR_MAP_ELEMENT_H
#define PYR_MAP_ELEMENT_H


#include <string>
#include <vector>
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
        std::string name;

        Vec2f pos;

        /**
         * Allows more convenient syntax when creating MapVisitors on
         * the stack.  i.e. nameless temporaries
         */
        virtual void handleVisitor(MapVisitor& v) = 0;
    };
    typedef RefPtr<MapElement> MapElementPtr;


    class VertexArray : public RefCounted {
    protected:
        ~VertexArray() { }

    public:
        std::vector<Vec3f> positions;
        std::vector<Vec3f> normals;
        std::vector<Vec2f> texCoords;
    };
    typedef RefPtr<VertexArray> VertexArrayPtr;


    class GeometryElement : public MapElement {
    protected:
        ~GeometryElement() { }

    public:
        struct Triangle {
            Vec3i pos;
            Vec3i n;
            Vec3i tc;
        };

        MaterialPtr material;

        VertexArrayPtr vertexArray;
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
