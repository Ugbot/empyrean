#include "CollisionBox.h"

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
    
    Vec2f CollisionBox::getDisplacement(float dt, Vec2f& vel, const std::vector<Segment>& segs,
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
            return Vec2f(0,0);
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
                    return Vec2f(minX-_verts[2][0],0);
                }
                else {
                    vel[0] = 0;
                    return Vec2f(maxX-_verts[0][0],0);
                }
            }
            else if(maxY > (_verts[2][1] + _verts[0][1])/2.0f) {
                vel[1] = dt * -9.81f; // To make the person start to fall down again.  
                vel[0] = 0;
                return Vec2f(0,minY-_verts[2][1]);
            }
            else {
                vel[1] = 0;          
                return Vec2f(0,maxY-_verts[0][1]);
            }

            return Vec2f(0,0);
        }
        else {
            // high speed crashing into earth collision
            vel[1] = 0;
            return Vec2f(0,maxY-_verts[0][1]);
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

    void CollisionBox::pointIntersect(std::vector<Vec2f>& points, const Segment& seg) {
       if(fabs(seg.v2[0] - seg.v1[0]) < 0.01) { // Vertical line
            if(seg.v1[0] > _verts[0][0] && seg.v1[0] < _verts[1][0]) {
                // Top line of box
                float ty = (_verts[2][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
                if(ty >= 0 && ty <= 1) {
                    points.push_back(Vec2f(seg.v1[0],_verts[0][1]));
                }
                // Bottom line of box
                ty = (_verts[0][1] - seg.v1[1])/(seg.v2[1] - seg.v1[1]);
                if(ty >= 0 && ty <= 1) {
                    points.push_back(Vec2f(seg.v1[0],_verts[0][1]));
                }
            }
            return;
        }
        else if(fabs(seg.v2[1] - seg.v1[1]) < 0.01) { // Horizontal line 
            if(seg.v1[1] > _verts[0][1] && seg.v1[1] < _verts[2][1]) {
                // Left line of box
                float tx = (_verts[0][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
                if(tx >= 0 && tx <= 1) {
                    points.push_back(Vec2f(_verts[0][0],seg.v1[1]));
                }
                // Right line of box
                tx = (_verts[1][0] - seg.v1[0])/(seg.v2[0] - seg.v1[0]);
                if(tx >= 0 && tx <= 1) {
                    points.push_back(Vec2f(_verts[1][0],seg.v1[1]));
                }
            }
            return;
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
                }
            }

            return;
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
}
