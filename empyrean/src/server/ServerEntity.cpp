#include "Map.h"
#include "MapVisitor.h"
#include "ServerEntity.h"

namespace pyr {

    struct Segment {
        Segment(const Vec2f& a, const Vec2f& b) {
            v1 = a;
            v2 = b;
        }

        Vec2f v1;
        Vec2f v2;
    };

    class Box {
    
    public:
        Box(const Vec2f& lowerLeft, const Vec2f& upperRight) {
               
            _verts[0][0] = lowerLeft[0];
            _verts[0][1] = lowerLeft[1];

            _verts[1][0] = upperRight[0];
            _verts[1][1] = lowerLeft[1];

            _verts[2][0] = upperRight[0];
            _verts[2][1] = upperRight[1];

            _verts[3][0] = lowerLeft[0];
            _verts[3][1] = upperRight[1];
        }
    
        const Vec2f& operator [] (int index) const {
            return _verts[index];
        }

        void getIntersectingSegs(std::vector<Segment>& interestingSegs, const std::vector<Segment>& segs) {
        
            for(size_t i = 0; i < segs.size(); ++i) {
                if(intersect(segs[i]) || inside(segs[i])) {
                    interestingSegs.push_back(segs[i]);
                }
            }

        }
    
        Vec2f getDisplacement(const std::vector<Segment>& segs) {
            return Vec2f(0,0);
        }

        bool intersect(const Segment& seg) {
            return false;
        }

        bool inside(const Segment& seg) {
            return false;
        }

    private:
        Vec2f   _verts[4];

    };


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


    void ServerEntity::update(float dt, Map* terrain) {

        Vec2f origPos = _pos;       // Save original position

        _pos += _vel * dt;
        _pos[1] = std::max(0.0f, _pos[1]); // collision detection
        _vel[1] -= 9.81f * dt;             // gravity

        float height = 1.9f;
        float width = 0.4f;

        Box origBox(origPos - Vec2f(width / 2.0f, 0),
                    origPos + Vec2f(width / 2.0f, height));

        Box newBox(_pos - Vec2f(width / 2.0f, 0),
                   _pos + Vec2f(width / 2.0f, height));

        float maxX = std::max(newBox[1][0],origBox[1][0]);
        float minX = std::min(newBox[0][0],origBox[0][0]);
        float maxY = std::max(newBox[2][1],origBox[2][1]);
        float minY = std::min(newBox[1][1],origBox[1][1]);

        Box bigBox(Vec2f(minX, minY),Vec2f(maxX,maxY));

        std::vector<Segment> segs;
        SegmentExtractor extractor(segs);
        terrain->handleVisitor(extractor);

        std::vector<Segment> interestingSegs;
        bigBox.getIntersectingSegs(interestingSegs, segs);

        Vec2f displacement = newBox.getDisplacement(interestingSegs);


    }

}
