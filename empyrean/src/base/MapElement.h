#ifndef PYR_MAP_ELEMENT_H
#define PYR_MAP_ELEMENT_H


#include <map>
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
        MapElement() {
            scale = 1.0f;
        }

        typedef std::map<std::string, std::string> PropertyMap;

        std::string name;

        // Should be replaced by a 3x3 matrix.
        Vec2f pos;
        float scale;

        PropertyMap properties;

        void addProperty(const std::string& k, const std::string& v) {
            properties[k] = v;
        }

        /**
         * Allows more convenient syntax when creating MapVisitors on
         * the stack.  i.e. nameless temporaries
         */
        virtual void handleVisitor(MapVisitor& v) = 0;
    };
    PYR_REF_PTR(MapElement);


    class VertexArray : public RefCounted {
    protected:
        ~VertexArray() { }

    public:
        std::vector<Vec3f> positions;
        std::vector<Vec3f> normals;
        std::vector<Vec2f> texCoords;
    };
    PYR_REF_PTR(VertexArray);


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

        void calculateBounds();
        bool visible(Vec2f ll, Vec2f ur);

        virtual void handleVisitor(MapVisitor& v);

    private:
        Vec2f _min;
        Vec2f _max;
    };
    PYR_REF_PTR(GeometryElement);


    /// A MapElement with children.
    class GroupElement : public MapElement {
    public:
        std::vector<MapElementPtr> children;

        void addChild(MapElementPtr child) {
            children.push_back(child);
        }
    
        virtual void handleVisitor(MapVisitor& v);
    };
    PYR_REF_PTR(GroupElement);


    /// A MapElement that is just a placeholder or dummy.
    class DummyElement : public MapElement {
    public:
        virtual void handleVisitor(MapVisitor& v);
    };
    PYR_REF_PTR(DummyElement);

}

#endif
