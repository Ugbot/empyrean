#ifndef PYR_PLANAR_MAP_H
#define PYR_PLANAR_MAP_H


#include <vector>
#include "Debug.h"
#include "VecMath.h"


namespace pyr {

    /**
     * Represents a 2D planar map, stored as a doubly-connected edge
     * list (DCEL).
     */
    class PlanarMap {
    public:
        typedef size_t FaceIndex;
        typedef size_t HalfEdgeIndex;
        typedef size_t VertexIndex;

        struct Face {
            HalfEdgeIndex incidentEdge;
        };

        struct HalfEdge {
            FaceIndex     incidentFace;
            HalfEdgeIndex next;
            HalfEdgeIndex opposite;
            VertexIndex   start;
        };

        struct Vertex {
            Vec2f pos;
            std::vector<HalfEdgeIndex> incidentEdges;
        };

    public:
        void addFace(const std::vector<Vec2f>& points);

        size_t getVertexCount() const {
            return _vertices.size();
        }
        const Vertex& getVertex(size_t i) const {
            PYR_ASSERT(i >= 0 && i < getVertexCount(), "Invalid vertex index");
            return _vertices[i];
        }

    private:
        std::vector<Face>     _faces;
        std::vector<HalfEdge> _halfEdges;
        std::vector<Vertex>   _vertices;
    };

}


#endif
