#ifndef PYR_MAP_ELEMENT_H
#define PYR_MAP_ELEMENT_H


#include <string>
#include <vector>
#include <gmtl/Vec.h>
#include "RefCounted.h"
#include "RefPtr.h"
#include "VecMath.h"


namespace pyr {

    class MapVisitor;

    /// entities, triggers, obstructions should all inherit MapElement
    class MapElement : public RefCounted {
    public:
        Vec2f pos;

        // Allows more convenient syntax when creating MapVisitors on the stack.
        // ie. nameless temporaries.
        virtual void handleVisitor(MapVisitor& v) = 0;

    protected:
        virtual ~MapElement() {}
    };
    typedef RefPtr<MapElement> MapElementPtr;


    /**
     * This indexed triangle list setup is decidedly inconvenient.  I suppose
     * the internal interface can keep it under control, but consider ditching
     * it in favour of something less annoying if it does not.
     *
     * This class has grown much larger than I expected it to.  Messier too.
     */
    class GeometryElement : public MapElement {
    public:
        struct Vertex {
            Vec2f pos;
            Vec2f tex;
            Vec4f col;
        };

        // Triangle strips instead?
        struct Triangle {
            int vert[3];  // indices to use.

            bool operator == (const Triangle& rhs) const;
        };

        // typedefs because I use these more than once.  Also, it makes it 
        // easier to change the container type later.
        typedef std::vector<Vertex> VertList;
        typedef std::vector<Triangle> TriList;

        std::string texture;

        GeometryElement();

        // interface
        void addVert(
            const Vec2f& pos, 
            const Vec2f& tex, 
            const Vec4f& col);
        void updateVert(
            unsigned index,
            const Vec2f& pos, 
            const Vec2f& tex, 
            const Vec4f& col);
        void deleteVert(unsigned index);

        void addTri(int a, int b, int c);
        void updateTri(unsigned index, int a, int b, int c);
        void deleteTri(unsigned index);

        const VertList& vertices;   // list of vertices
        const TriList& tris;        // triples of point indeces

        virtual void handleVisitor(MapVisitor& v);

    private:
        VertList _verts;
        TriList  _tris;
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
