#include "Collider.h"
#include "CollisionBox.h"
#include "Map.h"
#include "MapVisitor.h"

namespace pyr {

    class SegmentExtractor : public MapVisitor {
    public:
        SegmentExtractor(std::vector<Segment>& segments, float z)
            : _segments(segments)
            , _plane(z)
        {
        }

        void visitGroup(GroupElement* e) {
            Vec2f oldPosition = _currentPosition;
            _currentPosition += e->pos;

            for (size_t i = 0; i < e->children.size(); i++) {
                e->children[i]->handleVisitor(*this);
            }

            _currentPosition = oldPosition;
        }

        void visitGeometry(GeometryElement* e) {
            Vec2f oldPosition = _currentPosition;
            _currentPosition += e->pos;

            std::vector<GeometryElement::Vertex>& v = e->vertices;

            for (size_t i = 0; i < e->triangles.size(); ++i) {
                // Should only need 2, but in the case of numerical instability...
                Vec2f intersections[3];
                int intersectionCount = 0;
                
                GeometryElement::Triangle& t = e->triangles[i];
                // For each segment in the triangle...
                for (int j = 0; j < 3; ++j) {
                    Vec3f v1 = v[t[j]];
                    Vec3f v2 = v[t[(j + 1) % 3]];

                    // Intersect each segment with the plane.
                    float dz = v2[2] - v1[2];
                    if (dz == 0) {
                        if (v1[2] == _plane) {
                            add(v1, v2);
                        }
                    } else {
                        float u = (_plane - v1[2]) / dz;
                        if (u >= 0 && u <= 1) {
                            intersections[intersectionCount++] = Vec2f(
                                v1[0] + u * (v2[0] - v1[0]),
                                v1[1] + u * (v2[1] - v1[1]));
                        }
                    }
                }

                if (intersectionCount == 2) {
                    add(intersections[0], intersections[1]);
                }
            }

            _currentPosition = oldPosition;
        }

    private:
        void add(const Vec3f& v1, const Vec3f& v2) {
            add(Vec2f(v1[0], v1[1]),
                Vec2f(v2[0], v2[1]));
        }

        void add(const Vec2f& v1, const Vec2f& v2) {
            _segments.push_back(Segment(
                v1 + _currentPosition,
                v2 + _currentPosition));
        }

        Vec2f _currentPosition;
        std::vector<Segment>& _segments;
        float _plane;
    };

    CollisionData collide(float dt, const Vec2f& origPos, Vec2f& newPos, Vec2f& vel,
                          float width, float height, const Map* terrain) {
                          
        CollisionBox newBox(newPos - Vec2f(width / 2.0f, 0),
                            newPos + Vec2f(width / 2.0f, height));

        std::vector<Segment> segs;
        SegmentExtractor extractor(segs, -15); /// @todo -15 is hard coded for the map we're using...
        terrain->handleVisitor(extractor);

        CollisionData rv;
        newBox.getIntersectingSegs(rv.interesting, segs);

        Vec2f displacement = newBox.getDisplacement(dt,vel,rv.interesting, rv.points);

        newPos += displacement;

        return rv;
    }
}
