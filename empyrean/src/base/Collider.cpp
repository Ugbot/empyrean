#include "Collider.h"
#include "CollisionBox.h"
#include "Map.h"
#include "MapVisitor.h"

namespace pyr {

    class SegmentExtractor : public MapVisitor {
    public:
        SegmentExtractor(std::vector<Segment>& segments)
            : _segments(segments)
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

            for (size_t i = 0; i < e->triangles.size(); ++i) {
                GeometryElement::Triangle& t = e->triangles[i];
                std::vector<GeometryElement::Vertex>& v = e->vertices;
                add(v[t[0]], v[t[1]]);
                add(v[t[1]], v[t[2]]);
                add(v[t[2]], v[t[0]]);
            }

            _currentPosition = oldPosition;
        }

    private:
        void add(const Vec3f& v1, const Vec3f& v2) {
            Vec2f w1 = Vec2f(v1[0], v1[1]) + _currentPosition;
            Vec2f w2 = Vec2f(v2[0], v2[1]) + _currentPosition;
            _segments.push_back(Segment(w1, w2));
        }

        Vec2f _currentPosition;
        std::vector<Segment>& _segments;
    };

    CollisionData collide(const Vec2f& origPos, Vec2f& newPos, Vec2f& vel,
                          float width, float height, const Map* terrain) {
                          
        /*
        CollisionBox origBox(origPos - Vec2f(width / 2.0f, 0),
                    origPos + Vec2f(width / 2.0f, height));

        float maxX = std::max(newBox[1][0],origBox[1][0]);
        float minX = std::min(newBox[0][0],origBox[0][0]);
        float maxY = std::max(newBox[2][1],origBox[2][1]);
        float minY = std::min(newBox[1][1],origBox[1][1]);

        CollisionBox bigBox(Vec2f(minX, minY),Vec2f(maxX,maxY));
        */

        CollisionBox newBox(newPos - Vec2f(width / 2.0f, 0),
                            newPos + Vec2f(width / 2.0f, height));

        std::vector<Segment> segs;
        SegmentExtractor extractor(segs);
        terrain->handleVisitor(extractor);

        CollisionData rv;
        newBox.getIntersectingSegs(rv.interesting, segs);

        Vec2f displacement = newBox.getDisplacement(rv.interesting, rv.points);

        if(displacement[1] != 0) {
            vel[1] = 0;
        }

        newPos += displacement;

        return rv;
    }
}
