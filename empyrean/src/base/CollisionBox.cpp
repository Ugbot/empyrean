#include "CollisionBox.h"
#include "Constants.h"
#include "Log.h"
//#include "VisDebug.h"

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
    
    Vec2f CollisionBox::findInsideVertex(std::vector<Side>& hitlist) {
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

    // GMTL is retarded.  You can't use operator[] on const Matrix references, apparently.
    bool invert(gmtl::Matrix22f mat, gmtl::Matrix22f& invmat) {
        float den = mat[0][0] * mat[1][1] - mat[1][0] * mat[0][1];
        if (den == 0) {
            return false;
        }

        //PYR_ASSERT(den != 0, "determinant is zero");
        float mult = 1/den;
        invmat.set(mat[1][1], -mat[0][1], -mat[1][0], mat[0][0]);
        invmat *= mult;
        return true;
    }

    bool CollisionBox::findCollision(std::vector<Side>& sides, CollisionBox& otherBox, std::vector<Vec2f>& points) {
        sides.clear();

        // Get the segments box two
        std::vector<Segment> segs;
        otherBox.segment(segs);

        // Find which sides on box one are intersecting segments of box two
        Side hit;
        for(size_t i = 0; i<segs.size(); ++i) {
            // Normal Interesection
            hit = pointIntersect(points,segs[i]);
            if(hit != NONE) {
                sides.push_back(hit);
            }
        }

        return sides.size() > 0;
    }

    bool goingTowards(const Vec2f& vel, const Vec2f& pos, const Vec2f& secPos) {
        Vec2f posVec = secPos - pos;
        float dotprod = gmtl::dot(posVec, vel);
        if(dotprod > 0) {
            return true;
        }
        return false;
    }

    collision::COLLISION_TYPE CollisionBox::collideWithDynamic(float dt, const Vec2f& vel2, CollisionBox& box2, CollisionData& colDat) {

        // Save the velocity to a convenience variable 
        Vec2f vel = colDat.velocity;

        // Test to see if they are going away from each other if they are.. stop
        if(!goingTowards(vel,this->getCenter(),box2.getCenter()) && !goingTowards(vel,this->getCenter(),box2.getCenter())) {
            return collision::NONE;
        }

        // Find which sides on box one are intersecting segments of box two
        std::vector<Side> sidesHitBox1;
        std::vector<Vec2f> points;
        findCollision(sidesHitBox1,box2,points);

        points.clear(); // will get the same points twice otherwise

        // Find which sides on box two are intersecting segments of box one and get the intersection points
        std::vector<Side> sidesHitBox2;
        box2.findCollision(sidesHitBox2,*this,points);

        // Hitting on a vertex of the boxes is not a collision (for now) nor is complete overlap
        if(points.size() != 2) {
            return collision::NONE;
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
        if (!pyr::invert(A, Ainv)) {
            return collision::NONE;
        }
        test = Ainv * A;
        x = Ainv*b;

        // Save the new velocity, time, and distance
        axisRotMat.set(gmtl::Math::cos(-axisRot),gmtl::Math::sin(-axisRot),-gmtl::Math::sin(-axisRot),gmtl::Math::cos(-axisRot));
        colDat.velocity = axisRotMat * Vec2f(x[0],velBox1PreCol[1]);
        Vec2f unitVel = colDat.velocity;
        gmtl::normalize(unitVel);
        colDat.displacement = unitVel * (gmtl::length(points[2] - points[1]) * mass1 / (mass1 + mass2));
        colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
        if (colDat.time > dt) {
            colDat.time = dt;
        }
        
        if(fabs(this->getCenter()[1] - box2.getCenter()[1]) < 0.5) {
            return collision::ENTITY_HORIZ;
        }
        else if(this->getCenter()[1] > box2.getCenter()[1]) {
            return collision::ENTITY_ABOVE;
        }
        else {
            return collision::ENTITY_BELOW;
        }
    }
    
   bool CollisionBox::collideWithStationary(float dt, CollisionData& colDat, const std::vector<Segment>& segs,
                                        Vec2f& groundVec) {

        // Save the velocity to a convenience variable and check to see if we are not moving
        Vec2f vel = colDat.velocity;
        if(gmtl::length(vel) <= 0.1) {
            colDat.velocity = Vec2f(0,0);
            colDat.type = collision::NOT_MOVING;
            return false;
        }
     
        // Create side point and Segments
        Vec2f topPoint(_center[0], _verts[2][1] - 0.008f);
        Vec2f rightPoint(_verts[2][0], _center[1]);
        Vec2f leftPoint(_verts[0][0], _center[1]);
        Vec2f bottomPoint(_center[0], _verts[0][1] + 0.008f);
        Vec2f topRightPoint(_verts[2][0], _verts[2][1] - 0.008f);
        Vec2f bottomRightPoint(_verts[2][0], _verts[0][1] + 0.008f);
        Vec2f topLeftPoint(_verts[0][0], _verts[2][1] - 0.008f);
        Vec2f bottomLeftPoint(_verts[0][0], _verts[0][1] + 0.008f);
  
        // Check to see if we are in the ground already
        
        Segment groundDetector;
        groundDetector = Segment(bottomPoint,bottomPoint + Vec2f(0,topPoint[1] - bottomPoint[1]) * 0.45f);
        
        Vec2f displacementPt = bottomPoint;
        int index = -1;
        for(size_t i = 0; i<segs.size(); ++i) {
            Vec2f iPoint;
            float t = intersectLine(iPoint, groundDetector, segs[i]);
            if(t >= 0 && t <= 1) {
                if(iPoint[1] > displacementPt[1]) {
                    displacementPt = iPoint;
                    index = i;
                }
            }
        }
        
        if(index != -1) {
                colDat.displacement = (displacementPt - bottomPoint) * 1.05f;
                colDat.type = collision::GROUND_BELOW;
                colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
                if(colDat.time > dt) {
                    colDat.time = dt;
                }
            
                Segment ground = segs[index];
                if (ground.v2[0] < ground.v1[0]) {
                    std::swap(ground.v1,ground.v2);
                }

                groundVec = ground.v2 - ground.v1;
                gmtl::normalize(groundVec);
                if (groundVec[0] < 0) {
                    groundVec = groundVec * -1.0f;
                }
                return true;
        }

        // top detector
        groundDetector = Segment(topPoint,topPoint - Vec2f(0,topPoint[1] - bottomPoint[1]) * 0.45f);
        
        displacementPt = topPoint;
        index = -1;
        for(size_t i = 0; i<segs.size(); ++i) {
            Vec2f iPoint;
            float t = intersectLine(iPoint, groundDetector, segs[i]);
            if(t >= 0 && t <= 1) {
                if(iPoint[1] < displacementPt[1]) {
                    displacementPt = iPoint;
                    index = i;
                }
            }
        }
        
        if(index != -1) {
                colDat.displacement = (displacementPt - topPoint) * 1.05f;
                colDat.type = collision::GROUND_ABOVE;
                colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
                if(colDat.time > dt) {
                    colDat.time = dt;
                }
            
                Segment ground = segs[index];
                if (ground.v2[0] < ground.v1[0]) {
                    std::swap(ground.v1,ground.v2);
                }

                groundVec = ground.v2 - ground.v1;
                gmtl::normalize(groundVec);
                if (groundVec[0] < 0) {
                    groundVec = groundVec * -1.0f;
                }
                return true;
        }

        // leftside
        groundDetector = Segment(leftPoint,leftPoint + Vec2f(rightPoint[0]-leftPoint[0],0) * 0.45f);

        displacementPt = leftPoint;
        index = -1;
        for(size_t i = 0; i<segs.size(); ++i) {
            Vec2f iPoint;
            float t = intersectLine(iPoint, groundDetector, segs[i]);
            if(t >= 0 && t <= 1) {
                if(iPoint[0] > displacementPt[0]) {
                    displacementPt = iPoint;
                    index = i;
                }
            }
        }
        
        if(index != -1) {
                colDat.displacement = (displacementPt - leftPoint) * 1.05f;
                colDat.type = collision::GROUND_BELOW;
                colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
                if(colDat.time > dt) {
                    colDat.time = dt;
                }
            
                Segment ground = segs[index];
                if (ground.v2[0] < ground.v1[0]) {
                    std::swap(ground.v1,ground.v2);
                }

                groundVec = ground.v2 - ground.v1;
                gmtl::normalize(groundVec);
                if (groundVec[0] < 0) {
                    groundVec = groundVec * -1.0f;
                }
                return true;
        }

        // right point
        groundDetector = Segment(rightPoint,rightPoint - Vec2f(rightPoint[0]-leftPoint[0],0) * 0.45f);
        
        displacementPt = rightPoint;
        index = -1;
        for(size_t i = 0; i<segs.size(); ++i) {
            Vec2f iPoint;
            float t = intersectLine(iPoint, groundDetector, segs[i]);
            if(t >= 0 && t <= 1) {
                if(iPoint[0] < displacementPt[0]) {
                    displacementPt = iPoint;
                    index = i;
                }
            }
        }
        
        if(index != -1) {
                colDat.displacement = (displacementPt - rightPoint) * 1.05f;
                colDat.type = collision::GROUND_BELOW;
                colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
                if(colDat.time > dt) {
                    colDat.time = dt;
                }
            
                Segment ground = segs[index];
                if (ground.v2[0] < ground.v1[0]) {
                    std::swap(ground.v1,ground.v2);
                }

                groundVec = ground.v2 - ground.v1;
                gmtl::normalize(groundVec);
                if (groundVec[0] < 0) {
                    groundVec = groundVec * -1.0f;
                }
                return true;
        }


        // Determine the vectors between the center points of the collision box
        // and where those points would be next frame without a collision.
        Vec2f something = vel*dt;
        //normalize(something);
        //something *= 0.1;
        Segment topSeg(topPoint, topPoint + something);
        Segment rightSeg(rightPoint, rightPoint + something);
        Segment leftSeg(leftPoint, leftPoint + something);
        Segment bottomSeg(bottomPoint, bottomPoint + something);
        Segment bottomRightSeg(bottomRightPoint, bottomRightPoint + something);
        Segment bottomLeftSeg(bottomLeftPoint, bottomLeftPoint + something);
        Segment topRightSeg(topRightPoint, topRightPoint + something);
        Segment topLeftSeg(topLeftPoint, topLeftPoint + something);

        std::vector<Segment> vectorSegs;
        vectorSegs.push_back(bottomSeg);
        vectorSegs.push_back(rightSeg);
        vectorSegs.push_back(topSeg);
        vectorSegs.push_back(leftSeg);
        vectorSegs.push_back(bottomRightSeg);
        vectorSegs.push_back(bottomLeftSeg);
        vectorSegs.push_back(topRightSeg);
        vectorSegs.push_back(topLeftSeg);
        //the<VisDebug>().addSegment(bottomSeg.v1,bottomSeg.v2,Vec3f(1,0,0));
        //the<VisDebug>().addSegment(rightSeg.v1,rightSeg.v2,Vec3f(0,1,0));
        //the<VisDebug>().addSegment(topSeg.v1,topSeg.v2,Vec3f(0,0,1));
        //the<VisDebug>().addSegment(leftSeg.v1,leftSeg.v2,Vec3f(1,1,1));

        float sideHitDistance[8] = { -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f, -1.0f };
        int segIndexHit[8] = { 0, 0, 0, 0, 0, 0, 0, 0 };
        // Go through each segment in the terrain
        for(size_t i = 0; i<segs.size(); ++i) {
            // Go through each vector segment of the collision box 
            for(size_t j = 0; j<vectorSegs.size(); ++j) {
                //the<VisDebug>().addSegment(segs[i].v1,segs[i].v2,Vec3f(i==0?1.0f:0,i==1?1:0,i>1?1:0));

                Vec2f intersectPt;
                if(this->intersectLine(intersectPt,vectorSegs[j], segs[i]) != -1) {
                    // If there is an intersection calculate how far along the vector the point is
                    // (save only the minimum)
                    Segment o = vectorSegs[j];
                    Segment l = segs[i];
                    Vec2f dist = intersectPt - vectorSegs[j].v1;
                    if (sideHitDistance[j] == -1 || sideHitDistance[j] > gmtl::length(dist)) {
                        sideHitDistance[j] = gmtl::length(dist);
                        segIndexHit[j] = i;
                    }
                }
            }
        }

        // Check for a collision and exit if there is not one
        bool isCollision = false;
        for (int i=0; i<8; i++) {
            if (sideHitDistance[i] != -1) {
                isCollision = true;
            }
        }
        if (!isCollision) {            
            return false;
        }

        // Find the minimum instersection distance of the eight
        int isectIndex = 0;
        for (int i=1; i<8; i++) {
            if (sideHitDistance[i] > 0) {
                if (sideHitDistance[i] < sideHitDistance[isectIndex] || sideHitDistance[isectIndex] < 0) {
                    isectIndex = i;
                }
            }
        }
    
        // Get the ground direction vector
        Segment ground = segs[segIndexHit[isectIndex]];
        if (ground.v2[0] < ground.v1[0]) {
            std::swap(ground.v1,ground.v2);
        }
        /*
        if (fabs(ground.v2[0]-ground.v1[0]) < 0.05) {
            groundAngle = PI;
        }
        else {
            groundAngle = atan2(ground.v2[1]-ground.v1[1],(ground.v2[0]-ground.v1[0]));
            //Vec2f groundVec = ground.v1 - ground.v2;
            //the<VisDebug>().addSegment(ground.v1,ground.v1+Vec2f(gmtl::length(groundVec)*cos(groundAngle),gmtl::length(groundVec)*sin(groundAngle)),Vec3f(1,1,0));
        }*/

        // Zero out the velocity normal to the ground as the change to velocity
        groundVec = ground.v2 - ground.v1;
        gmtl::normalize(groundVec);
        if (groundVec[0] < 0) {
            groundVec = groundVec * -1.0f;
        }
        float cosVelToGround = gmtl::dot(groundVec,vel) / gmtl::length(vel);
        float velComp = cosVelToGround * gmtl::length(vel);
        vel = groundVec * velComp;

        // Save the displacement, velocity, and time to make the side that is hit at the intersection pt
        Vec2f normVec = colDat.velocity;
        gmtl::normalize(normVec);
        PYR_ASSERT(length(normVec) > 0, "normVec is zero-length");
        colDat.displacement = normVec * (sideHitDistance[isectIndex] - 0.01f) * 0.9f;
        PYR_ASSERT(length(colDat.velocity) > 0, "colDat.velocity is zero-length");
        colDat.time = gmtl::length(colDat.displacement)/gmtl::length(colDat.velocity);
                        
        if(gmtl::dot(colDat.velocity, vel) < 0 ) {
            std::cout << "Ah" << std::endl;
        }

        if((gmtl::length(vel) - gmtl::length(colDat.velocity)) > 0.01) {
        std::cout << "Ah" << std::endl;
        }

        if (fabs(colDat.time) > 0.05) {
            std::cout << "Doh" << std::endl;
        }

        if (fabs(colDat.time) > dt) {
            std::cout << "Doh" << std::endl;
        }

        colDat.velocity = vel;
        
        
        if(isectIndex == 2) {
            colDat.type = collision::GROUND_ABOVE;            
        }
        else {
            colDat.type = collision::GROUND_BELOW;
        }
        
        return true;
        
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

    float CollisionBox::intersectLine(Vec2f& point, const Segment& seg1, const Segment& seg2) {
    
        float x1 = (seg1.v2[0] - seg1.v1[0]);
        float x2 = (seg2.v2[0] - seg2.v1[0]);
        float y1 = (seg1.v2[1] - seg1.v1[1]);
        float y2 = (seg2.v2[1] - seg2.v1[1]);

        /*gmtl::Matrix22f A, Ainv;
        A.set(x1,-x2,y1,-y2);
        Vec2f b(-seg1.v1[0] + seg2.v1[0], -seg1.v1[1] + seg2.v1[1]);

        if (!invert(A,Ainv)) {
            point = Vec2f(0,0);
            return -1.0f;
        }

        Vec2f t0 = Ainv * b;
        */
        float den = x2*y1 - x1*y2;
        if (den == 0) {
            // Parallel lines - no intersection
            point = Vec2f(0,0);
            return -1.0f;
        }
        float t = ((seg2.v1[1] - seg1.v1[1])*x2 + (seg1.v1[0] - seg2.v1[0])*y2)/den;
        float r = ((seg1.v1[0] - seg2.v1[0]) + t * x1)/x2;

        //float t = t0[0];
        //float r = t0[1];
    
        if( t < 0.005 || t > 1 || r < 0.005 || r > 1) {
            //PYR_LOG() << "t is BAD = " << t;
            // invalid t so no collision
            point = Vec2f(0,0);
            return -1.0f;
        }
        else {
            //PYR_LOG() << "t is GOOD = " << t;
            point[0] = seg1.v1[0] * (1 - t) + seg1.v2[0] * t;
            point[1] = seg1.v1[1] * (1 - t) + seg1.v2[1] * t;
            return t;
        }

    }

    CollisionBox::Side CollisionBox::pointIntersect(std::vector<Vec2f>& points, const Segment& seg) {
       
        std::vector<Segment> segs;
        this->segment(segs);

        Side sideHit = NONE;
        for(size_t i = 0; i < segs.size(); ++i) {
            Vec2f intersectPt;
            float t = this->intersectLine(intersectPt, segs[i], seg);
            if (t >= 0 && t <= 1) {
                points.push_back(intersectPt);
                sideHit = (Side)i;
            }
        }

        return sideHit;
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
