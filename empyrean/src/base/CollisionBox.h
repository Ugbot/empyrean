#ifndef PYR_COLLISION_BOX_H
#define PYR_COLLISION_BOX_H

#include "Collider.h"
#include "Constants.h"
#include "VecMath.h"

namespace pyr {

   

    class CollisionBox {      

    public:
        enum Side {
            BOTTOM=0, RIGHT=1, TOP=2, LEFT=3, NONE=4
        };
        
        CollisionBox(const Vec2f& lowerLeft, const Vec2f& upperRight);
        CollisionBox(const Vec2f& bottomcenter, const float width, const float height);

        const Vec2f& operator [] (int index) const;
        
        void getIntersectingSegs(std::vector<Segment>& interestingSegs,
                                 const std::vector<Segment>& segs);
        
        collision::COLLISION_TYPE collideWithDynamic(float dt, const Vec2f& vel2, CollisionBox& box2, CollisionData& colDat);

        bool collideWithStationary(float dt, CollisionData& colDat, const std::vector<Segment>& segs,
                                        Vec2f& groundVec);

        bool findCollision(std::vector<Side>& sides, CollisionBox& otherBox, std::vector<Vec2f>& points); 

        void segment(std::vector<Segment>& segs);
        Vec2f getCenter();
        Vec2f findInsideVertex(std::vector<Side>& hitlist);
        Vec2f getDisplacement();
        void setDisplacement(Vec2f disp);
        Side pointIntersect(std::vector<Vec2f>& points, const Segment& seg);

    private:
        float intersectLine(Vec2f& point, const Segment& seg1, const Segment& seg2);
        bool interestingSeg(const Segment& seg);
        bool segmentInside(const Segment& seg);
        bool pointInside(const Vec2f& pt);
        
        Vec2f   _verts[4];
        Vec2f   _center;
        Vec2f   _displacement;
    };
}
#endif
