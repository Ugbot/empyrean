#include "Collider.h"
#include "CollisionBox.h"
#include "Constants.h"
#include "Entity.h"
#include "Map.h"
#include "MapVisitor.h"
#include "PlayerBehavior.h"
#include "Profiler.h"

namespace pyr {

    

    struct CollisionRegion {
        std::vector<int> indici;
    };

    //CollisionData collideWithWorld(float dt, const Vec2f& origPos, Vec2f& newPos, 
    //                               Vec2f& vel, const BoundingRectangle& bounds, const Map* terrain) {
    
    CollisionData collideWithWorld(float dt, Entity* ent, const Map* terrain) {
        CollisionBox newBox(ent->getPos() + ent->getBounds().min, 
                            ent->getPos() + ent->getBounds().max);
        
        std::vector<Segment> segs;
        terrain->getSegs(segs);
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

        /*collision::COLLISION_TYPE result = */entityBox.collideWithDynamic(0,ent1->getVel(),ent2->getVel(), otherBox, rv.points);
    };

    void resolveCollisions(float dt, const Map* terrain, std::vector<Entity*>& ents) {
        PYR_PROFILE_BLOCK("resolveCollisions");

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

    }    
}
