#ifndef PYR_PLANAR_MAP_H
#define PYR_PLANAR_MAP_H


#include <vector>
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
        };

    private:
        std::vector<Face>     _faces;
        std::vector<HalfEdge> _halfEdges;
        std::vector<Vertex>   _vertices;
    };

}


#endif
