#include "Collider.h"
#include "CollisionBox.h"
#include "Constants.h"
#include "Entity.h"
#include "Map.h"
#include "MapVisitor.h"
#include "PlayerBehavior.h"

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
            Vec3f currentPos(_currentPosition[0], _currentPosition[1], 0);

            std::vector<Vec3f>& v = e->vertexArray->positions;

            for (size_t i = 0; i < e->triangles.size(); ++i) {
                // Should only need 2, but in the case of numerical instability...
                Vec2f intersections[3];
                int intersectionCount = 0;
                
                GeometryElement::Triangle& t = e->triangles[i];
                // For each segment in the triangle...
                for (int j = 0; j < 3; ++j) {
                    Vec3f v1 = currentPos + v[t.pos[j]];
                    Vec3f v2 = currentPos + v[t.pos[(j + 1) % 3]];

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
            _segments.push_back(Segment(v1, v2));
        }

        Vec2f _currentPosition;
        std::vector<Segment>& _segments;
        float _plane;
    };

    struct CollisionRegion {
        std::vector<int> indici;
    };

    //CollisionData collideWithWorld(float dt, const Vec2f& origPos, Vec2f& newPos, 
    //                               Vec2f& vel, const BoundingRectangle& bounds, const Map* terrain) {
    
    CollisionData collideWithWorld(float dt, Entity* ent, const Map* terrain) {
        CollisionBox newBox(ent->getPos() + ent->getBounds().min, 
                            ent->getPos() + ent->getBounds().max);
        
        std::vector<Segment> segs;
        SegmentExtractor extractor(segs, 0);
        terrain->handleVisitor(extractor);

        CollisionData rv;
        newBox.getIntersectingSegs(rv.interesting, segs);

        collision::COLLISION_TYPE result = newBox.collideWithStationary(dt,ent->getVel(),rv.interesting, rv.points);
        
        if(result == collision::GROUND_BELOW) {        
            Behavior* beh = ent->getBehavior();
            PlayerBehavior* pb = dynamic_cast<PlayerBehavior*>(beh);
            if(pb) {
                pb->handleEvent(ent, "Reset Jumping");
            }
        }
        
        ent->getPos() += newBox.getDisplacement();
              
        return rv;
    };

    
    void collideWithEntity(Entity* ent1, Entity* ent2) {
        
        CollisionBox entityBox(ent1->getPos() + ent1->getBounds().min, ent1->getPos() + ent1->getBounds().max);
        CollisionBox otherBox(ent2->getPos() + ent2->getBounds().min, ent2->getPos() + ent2->getBounds().max);
        
        CollisionData rv;

        entityBox.collideWithDynamic(0,ent1->getVel(),ent2->getVel(), otherBox, rv.points);
        //ent1->getPos() += entityBox.getDisplacement();
        //ent2->getPos() += otherBox.getDisplacement();
    };

    void resolveCollisions(float dt, Map* terrain, std::vector<Entity*>& ents) {
        int* entityRegionAssignment = new int[ents.size()];
        std::vector<CollisionRegion> regions;

        // Clear region assignments
        for (size_t i = 0; i < ents.size(); ++i) {
            entityRegionAssignment[i] = collision::REGION_UNASSIGNED; 
        }
    
        int regionNumber = 0;
        // Classify the entities into different regions (this is to speed up collisions between entities)
        for (size_t i = 0; i < ents.size(); ++i) {
            if(entityRegionAssignment[i] == collision::REGION_UNASSIGNED) {
                CollisionRegion currentRegion;
                for(size_t j = 0; j < ents.size(); ++j) {
                    if(gmtl::length(ents[i]->getPos() - ents[j]->getPos()) < collision::REGION_RADIUS) {
                        entityRegionAssignment[j] = regionNumber;
                        currentRegion.indici.push_back((int) j);
                    }
                }
                regionNumber++;
                regions.push_back(currentRegion);
            }
        }    

        // Collisions
        for (size_t i = 0; i < regions.size(); ++i) {
            if(regions[i].indici.size() == 1) {  // Simply collide with the ground
                int index = regions[i].indici[0];
                collideWithWorld(dt,ents[index],terrain);
            }
            else { // More than one entity in the area so need to collide with the other entities in the area
                for(size_t j = 0; j < regions[i].indici.size(); ++j) {
                    for(size_t k = 0; k < regions[i].indici.size(); ++k) {
                        if(j!=k) {  // Don't Collide with yourself
                            // Ultimately collide with others here
                            int index1 = regions[i].indici[j];
                            int index2 = regions[i].indici[k];
                            collideWithEntity(ents[index1],ents[index2]);
                        }
                    }
                }

                for(size_t j = 0; j < regions[i].indici.size(); ++j) {
                    // Collide everyone with the ground after all
                    int index = regions[i].indici[j];
                    collideWithWorld(dt,ents[index],terrain);
                }
            }
        }

    };    
        /*
        // Clear region assignments
        for (size_t i = 0; i < ents.size(); ++i) {
            ents[i].region = collision::REGION_UNASSIGNED;
        }
        
        std::vector<region> regions;

        // Classify the entities into different regions (this is to speed up collisions between entities)
        for (size_t i = 0; i < ents.size(); ++i) {
            if(ents[i].region == collision::REGION_UNASSIGNED) {
                region currentRegion;
                currentRegion.indici.push_back(i);
                for(size_t j = 0; j < ents.size(); ++j) {
                    if(vecDistance(*(ents[i].pos), *(ents[j].pos)) < collision::REGION_RADIUS) {
                        ents[j].region = i;
                        currentRegion.indici.push_back(j);
                    }
                }
                regions.push_back(currentRegion);
            }
        }

        // Do collision on each of the regions
        for (size_t i = 0; i < regions.size(); ++i) {
            if(regions[i].indici.size() == 1) {  // Simply collide with the ground
                int index = regions[i].indici[0];
                collide(dt,*(ents[index].pos),*(ents[index].vel),ents[index].width, ents[index].height, terrain);
            }
            else {
                for(size_t j = 0; j < regions[i].indici.size(); ++j) {
                    for(size_t k = 0; k < regions[i].indici.size(); ++k) {
                        if(j!=k) {  // Don't Collide with yourself
                            // Ultimately collide with others here          
                        }
                    }
                }

                for(size_t j = 0; j < regions[i].indici.size(); ++j) {
                    // Collide everyone with the ground after all
                    int index = regions[i].indici[j];
                    collide(dt,*(ents[index].pos),*(ents[index].vel),ents[index].width, ents[index].height, terrain);
                }
            }
        }
        */


    //// For testing to see if jumping is done
    //Vec2f precollideposition = getPos();
    //Vec2f precollidevelocity = getVel();

    //_lastCD = collide(dt, origPos, getPos(), getVel(), getWidth(), getHeight(), terrain);

    //// If you are higher than you once were so you were forced up and you were falling 
    //// (before the collision) This means that you hit a surface below you so therefore 
    //// reset jumping
    //if((precollideposition[1]-getPos()[1]) < 0 && precollidevelocity[1] < FALLING_SPEED) {
    //        getJumping() = 0;
    //}

    //}
    //}

}
