#include "PlanarMap.h"


namespace pyr {

    struct SegmentSet {
        typedef size_t VertexIndex;
        typedef size_t SegmentIndex;

        struct Vertex {
            Vec2f pos;
            std::vector<SegmentIndex> outbound;
        };

        struct Segment {
            VertexIndex v1;
            VertexIndex v2;
        };

        SegmentSet(const std::vector<Vec2f>& points) {
            vertices.resize(points.size());
            for (size_t i = 0; i < points.size(); ++i) {
                vertices[i].pos = points[i];
            }
        }

        std::vector<Vertex> vertices;
        std::vector<Segment> segments;
    };

    void PlanarMap::addFace(const std::vector<Vec2f>& points) {


        _vertices.resize(points.size());
        for (size_t i = 0; i < points.size(); ++i) {
            _vertices[i].pos = points[i];
        }
    }

}
