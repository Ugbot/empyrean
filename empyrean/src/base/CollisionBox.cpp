#include "CollisionBox.h"
#include "Constants.h"
#include <gmtl/Math.h>

namespace pyr {

            


    CollisionBox::CollisionBox(const Vec2f& lowerLeft, const Vec2f& upperRight) {
                
        _verts[0][0] = lowerLeft[0];
        _verts[0][1] = lowerLeft[1];

        _verts[1][0] = upperRight[0];
        _verts[1][1] = lowerLeft[1];

        _verts[2][0] = upperRight[0];
        _verts[2][1] = upperRight[1];

        _verts[3][0] = lowerLeft[0];
        _verts[3][1] = upperRight[1];

        _center[0] = (upperRight[0] + lowerLeft[0])/2.0f;
        _center[1] = (upperRight[1] + lowerLeft[1])/2.0f;
        _displacement = Vec2f(0,0);
    }
    
    CollisionBox::CollisionBox(const Vec2f& bottomcenter, const float width, const float height) {
        
        _verts[0][0] = _verts[3][0] = bottomcenter[0] - width/2;
        _verts[0][1] = _verts[1][1] = bottomcenter[1];

        _verts[1][0] = _verts[2][0] = bottomcenter[0] + width/2;
        _verts[2][1] = _verts[3][1] = bottomcenter[1] + height;

        _center[0] = bottomcenter[0];
        _center[1] = bottomcenter[1] + height/2.0f;
        _displacement = Vec2f(0,0);

    }

    const Vec2f& CollisionBox::operator [] (int index) const {
        return _verts[index];
    }

    void CollisionBox::getIntersectingSegs(std::vector<Segment>& interestingSegs, const std::vector<Segment>& segs) {
        for(size_t i = 0; i < segs.size(); ++i) {
            if(interestingSeg(segs[i])) {
                interestingSegs.push_back(segs[i]);
            }
        }
    }
    
    Vec2f CollisionBox::findInsideVertex(Side* hitlist) {
        // Find Vertex of my box that is in box 2
        Vec2f insideVertex;
        if(hitlist[0] == BOTTOM || hitlist[1] == BOTTOM) {
            insideVertex[1] = _verts[0][1];
        }
        if(hitlist[0] == TOP || hitlist[1] == TOP) {
            insideVertex[1] = _verts[2][1];
        }
        if(hitlist[0] == RIGHT || hitlist[1] == RIGHT) {
            insideVertex[0] = _verts[1][0];
        }
        if(hitlist[0] == LEFT || hitlist[1] == LEFT) {
            insideVertex[0] = _verts[0][0];
        }
        return insideVertex;
    }

    gmtl::Matrix22f invert(gmtl::Matrix22f& mat) {
        float mult = 1/(mat[0][0] * mat[1][1] - mat[1][0] * mat[0][1]);
        gmtl::Matrix22f invmat;
        invmat.set(mat[1][1], -mat[0][1], -mat[1][0], mat[0][0]);
        invmat *= mult;
        return invmat;
    }

    void CollisionBox::collideWithDynamic(float dt, Vec2f& vel, Vec2f& vel2, CollisionBox& box2,
                                        std::vector<Vec2f>& points) {
       
        // Get the segments box two
        std::vector<Segment> segs;
        box2.segment(segs);

        // Find which sides on box one are intersecting segments of box two 
        Side sidesHitBox1[2];
        int hitCount = 0;
        Side hit;
        for(size_t i = 0; i<segs.size(); ++i) {
            // Normal Interesection
            hit = this->pointIntersect(points,segs[i]);
            if(hit != NONE) {
                sidesHitBox1[hitCount++] = hit;
            }
        }

        // Get the segments box one (me!)
        points.clear(); // will get the same points twice otherwise
        segs.clear();
        this->segment(segs);

        // Find which sides on box two are intersecting segments of box one and get the intersection points
        Side sidesHitBox2[2];
        hitCount = 0;
        for(size_t i = 0; i<segs.size(); ++i) {
            // Normal Interesection
            hit = box2.pointIntersect(points,segs[i]);
            if(hit != NONE) {
                sidesHitBox2[hitCount++] = hit;
            }
        }

        // Hitting on a vertex of the boxes is not a collision (for now)
        if(points.size() < 2) {
            return;
        } 
        
        Vec2f collisionVec =  _center - box2.getCenter();
        Vec2f xAxis(1,0);
        float axisRot = gmtl::Math::aCos(gmtl::dot(collisionVec,xAxis)/gmtl::length(collisionVec));
        if (collisionVec[1] < 0) {
            axisRot *= -1;
        }
        //gmtl::AxisAngle axisRotMat(axisRot,0,0,1);
        
        gmtl::Matrix22f axisRotMat;
        axisRotMat.set(gmtl::Math::cos(axisRot),gmtl::Math::sin(axisRot),-gmtl::Math::sin(axisRot),gmtl::Math::cos(axisRot));
        
        // Calculate the velocity vectors of the two boxes in the collision coordinate system (collisionVec = new x axis)
        Vec2f velBox1PreCol = axisRotMat * vel;
        Vec2f velBox2PreCol = axisRotMat * vel2;
        
        // Calculate the two boxes velocity vectors after the collisions
        float mass1 = 1.0f;
        float mass2 = 1.0f;
        const float coefOfRest = 0.25f;
        gmtl::Matrix22f A, Ainv, test;
        Vec2f x,b;
        A.set(mass1,mass2,-1,1);
        b.set(mass1*velBox1PreCol[0] + mass2*velBox2PreCol[0],-coefOfRest*(velBox2PreCol[0]-velBox1PreCol[0]));
        Ainv = invert(A);
        test = Ainv * A;
        x = Ainv*b;

        // Set the new velocities
        axisRotMat.set(gmtl::Math::cos(-axisRot),gmtl::Math::sin(-axisRot),-gmtl::Math::sin(-axisRot),gmtl::Math::cos(-axisRot));
        vel = axisRotMat * Vec2f(x[0],velBox1PreCol[1]);
        vel2 = axisRotMat * Vec2f(x[1],velBox2PreCol[1]);
        
        // Find the two verticis that are inside the other boxes
        Vec2f dispVert1 = this->findInsideVertex(sidesHitBox1);
        Vec2f dispVert2 = box2.findInsideVertex(sidesHitBox2);

        // Find the vector between these two inside vertici
        Vec2f dispVector = dispVert1 - dispVert2;
        if(dispVector[0] < dispVector[1]) {
            dispVector[1] = 0;
        }
        else {
            dispVector[0] = 0;
        }

        this->setDisplacement(-dispVector/2.0f);
        box2.setDisplacement(dispVector/2.0f);
    }

    void CollisionBox::collideWithStationary(float dt, Vec2f& vel, const std::vector<Segment>& segs,
                                        std::vector<Vec2f>& points) {
        for(size_t i = 0; i<segs.size(); ++i) {
            if(segmentInside(segs[i])) {
                // Something small is inside character... deal with later
            }
            else {
                // Normal Interesection
                pointIntersect(points,segs[i]);
            }
        }

        if(points.empty()) {
            return;
        }

        float maxY = points[0][1];
        for(size_t i = 1; i<points.size(); ++i) {
            maxY = std::max(maxY,points[i][1]);
        }
        
        float minY = points[0][1];
        for(size_t i = 1; i<points.size(); ++i) {
            minY = std::min(minY,points[i][1]);
        }
    
        float maxX = points[0][0];
        for(size_t i = 1; i<points.size(); ++i) {
            maxX = std::max(maxX,points[i][0]);
        }
        
        float minX = points[0][0];
        for(size_t i = 1; i<points.size(); ++i) {
            minX = std::min(minX,points[i][0]);
        }
        
        if(gmtl::length(vel) < 15) {

            // low velocity collisions
            if(maxY > (_verts[2][1] + _verts[0][1])/2.0 && minY < (_verts[2][1] + _verts[0][1])/2.0) {
                if(vel[0] > 0) {
                    vel[0] = 0;
                    return setDisplacement(Vec2f(minX-_verts[2][0],0));
                }
                else {
                    vel[0] = 0;
                    return setDisplacement(Vec2f(maxX-_verts[0][0],0));
                }
            }
            else if(maxY > (_verts[2][1] + _verts[0][1])/2.0f) {
                vel[1] = dt * constants::GRAVITY; // To make the person start to fall down again.  
                vel[0] = 0;
                return setDisplacement(Vec2f(0,minY-_verts[2][1]));
            }
            else {
                vel[1] = 0;          
                return setDisplacement(Vec2f(0,maxY-_verts[0][1]));
            }

            return;
        }
        else {
            // high speed crashing into earth collision
            vel[1] = 0;
            return setDisplacement(Vec2f(0,maxY-_verts[0][1]));
        }

    }

    bool CollisionBox::interestingSeg(const Segment& seg) {
        if(segmentInside(seg)) {
            return true;
        }
    
        if((seg.v1[0] > _verts[1][0] && seg.v2[0] > _verts[1][0]) ||    // Both to Right
            (seg.v1[0] < _verts[0][0] && seg.v2[0] < _verts[0][0]) ||    // Both to Left
            (seg.v1[1] > _verts[2][1] && seg.v2[1] > _verts[2][1]) ||    // Both Above
            (seg.v1[1] < _verts[1][1] && seg.v2[1] < _verts[1][1])   ) { // Both Below
            return false;
        }

        return true;
    }

    CollisionBox::Side CollisionBox::pointIntersect(std::vector<Vec2f>& points, const Segment& seg) {
       if(fabs(seg.v2[0] - seg.v1[0]) < 0.01) { // Vertical line
            if(seg.v1[0] > _verts[0][0] && seg.v1[0] < _verts[1][0]) {
                // Top line of box
                float ty = (_verts[2][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
                if(ty >= 0 && ty <= 1) {
                    points.push_back(Vec2f(seg.v1[0],_verts[0][1]));
                    return TOP;
                }
                // Bottom line of box
                ty = (_verts[0][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
                if(ty >= 0 && ty <= 1) {
                    points.push_back(Vec2f(seg.v1[0],_verts[0][1]));
                    return BOTTOM;
                }
            }
            return NONE;
        }
        else if(fabs(seg.v2[1] - seg.v1[1]) < 0.01) { // Horizontal line 
            if(seg.v1[1] > _verts[0][1] && seg.v1[1] < _verts[2][1]) {
                // Left line of box
                float tx = (_verts[0][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
                if(tx >= 0 && tx <= 1) {
                    points.push_back(Vec2f(_verts[0][0],seg.v1[1]));
                    return LEFT;
                }
                // Right line of box
                tx = (_verts[1][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
                if(tx >= 0 && tx <= 1) {
                    points.push_back(Vec2f(_verts[1][0],seg.v1[1]));
                    return RIGHT;
                }
            }
            return NONE;
        }
        else { // Normal line
            float tx,ty; 
            
            // Test floor
            ty = (_verts[0][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
            if(ty >= 0 && ty <= 1) {
                Vec2f intersectPt;
                intersectPt[0] = (1 - ty) * seg.v1[0] + ty * seg.v2[0];
                intersectPt[1] = _verts[1][1];
                if(pointInside(intersectPt)) {
                    points.push_back(intersectPt);
                    return BOTTOM;
                }
            }

            // Test Right wall
            tx = (_verts[1][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
            if(tx >= 0 && tx <= 1) {
                Vec2f intersectPt;
                intersectPt[0] = _verts[1][0];
                intersectPt[1] = (1 - tx) * seg.v1[1] + tx * seg.v2[1];
                if(pointInside(intersectPt)) {
                    points.push_back(intersectPt);
                    return RIGHT;
                }
            }
    
            // Test ceiling
            ty = (_verts[2][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
            if(ty >= 0 && ty <= 1) {
                Vec2f intersectPt;
                intersectPt[0] = (1 - ty) * seg.v1[0] + ty * seg.v2[0];
                intersectPt[1] = _verts[2][1];
                if(pointInside(intersectPt)) {
                    points.push_back(intersectPt);
                    return TOP;
                }
            }

            // Test Left wall
            tx = (_verts[0][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
            if(tx >= 0 && tx <= 1) {
                Vec2f intersectPt;
                intersectPt[0] = _verts[0][0];
                intersectPt[1] = (1 - tx) * seg.v1[1] + tx * seg.v2[1];
                if(pointInside(intersectPt)) {
                    points.push_back(intersectPt);
                    return LEFT;
                }
            }

            return NONE;
        }

    }

    void CollisionBox::segment(std::vector<Segment>& segs) {
        
        for(int i = 0; i < 4; ++i) {
            Segment s(_verts[i],_verts[(i+1)%4]);
            segs.push_back(s);
        }
    }

    bool CollisionBox::segmentInside(const Segment& seg) {
        if(pointInside(seg.v1) && pointInside(seg.v2)) {
            return true;
        }
        return false;
    }

    bool CollisionBox::pointInside(const Vec2f& pt) {
        if(pt[0] >= _verts[0][0] && pt[0] <= _verts[1][0] &&
            pt[1] >= _verts[0][1] && pt[1] <= _verts[2][1]    ) {
            return true;
        }
        return false;
    }

    void CollisionBox::setDisplacement(Vec2f disp) {
        _displacement = disp;
    }

    Vec2f CollisionBox::getDisplacement() {
        return _displacement;
    }

    Vec2f CollisionBox::getCenter() {
        return _center;
    }

}
