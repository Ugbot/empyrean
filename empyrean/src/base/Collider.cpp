#include "Collider.h"
#include "CollisionBox.h"
#include "Constants.h"
#include "Entity.h"
#include "Map.h"
#include "MapVisitor.h"
#include "PhysicsBehaviorSlot.h"
#include "PlayerBehavior.h"
#include "Profiler.h"
#include "Log.h"

namespace pyr {

    struct CollisionRegion {
        std::vector<int> indici;
    };

    CollisionData collideWithWorld(float dt, Entity* ent, const Map* terrain) {
        PhysicsBehaviorSlot* physics = ent->getBehavior()->getSlot<PhysicsBehaviorSlot>();
        PYR_ASSERT(physics,"Passed in a non-physics object to the collider!");

        CollisionBox newBox(ent->getNextPos() + ent->getBounds().min, 
                            ent->getNextPos() + ent->getBounds().max);
        
        // Get the terrain segments
        std::vector<Segment> segs;
        terrain->getSegs(segs,ent->getNextPos()[0]);
        
        // Create the CollisionData to store information about collisions
        CollisionData colDat;
        colDat.velocity = ent->getNextVel();

        // Determine which segment if any that the entity collides with
        newBox.collideWithStationary(dt,colDat,segs,physics->groundDir);
        
        // Change the physics info
        if(colDat.type == collision::GROUND_BELOW || colDat.type == collision::NOT_MOVING ||
           colDat.type == collision::GROUND_HORIZ                                            ) {        
            // Set the appropriate physics values
            if (physics->inAir) {
                physics->inAir = false;
            }
            Vec2f groundNorm(-physics->groundDir[1],physics->groundDir[0]);
            if (groundNorm[1] < 0) {
                groundNorm = groundNorm * -1; // reverse direction if wrong normal is computed
            }
            physics->groundNorm = groundNorm;
            //physics->coeffOfFriction = terrain->something(seg);
        }
      
        return colDat;
    };

    CollisionData collideWithEntity(float dt, Entity* ent1, Entity* ent2) {
        // Create the collision boxes for the two entities
        Vec2f box1Pos = ent1->getNextPos() + dt*ent1->getNextVel();
        Vec2f box2Pos = ent2->getNextPos() + dt*ent2->getNextVel();
        CollisionBox entityBox(box1Pos + ent1->getBounds().min, box1Pos + ent1->getBounds().max);
        CollisionBox otherBox(box2Pos + ent2->getBounds().min, box2Pos + ent2->getBounds().max);
        
        // Create the CollisionData to store information about collisions
        CollisionData colDat;
        colDat.velocity = ent1->getNextVel();

        // Collide with the other entity
        entityBox.collideWithDynamic(dt, ent2->getNextVel(), otherBox, colDat);

        return colDat;
    };

    void resolveCollisionsAndMove(float dt, const Map* terrain, const std::vector<Entity*>& ents) {
        PYR_PROFILE_BLOCK("resolveCollisions");

        int recurseDepth = 0;
        PhysicsBehaviorSlot* physics = 0; 

        // Resolve all the entities collisions and set the next values
        for(size_t i = 0; i < ents.size(); ++i) {
            recurseDepth = 0;
            physics = ents[i]->getBehavior()->getSlot<PhysicsBehaviorSlot>();
            //physics->inAir = true;
            std::vector<Entity*> noEntityCollision;
            collideEntity(dt,ents[i],terrain,noEntityCollision,recurseDepth);
        }
    }

    void collideEntity(float dt, Entity* ent, const Map* terrain, const std::vector<Entity*>& ents, int depth) {
        //PYR_PROFILE_BLOCK("collideEntity");
    
        // Check to see if we have recursed too far
        if (++depth > 5) {
            //PYR_ASSERT(0,"test");
            return;
        }

        // Check to see where the collision would be with the ground
        CollisionData groundData = collideWithWorld(dt,ent,terrain);

        // Check to see where the collision would be with another entity  OPTIMIZE THIS!!!
        CollisionData entColData, tempData;
        for (size_t i=0; i<ents.size(); ++i) {
            if (ents[i] != ent) {
                // Collide with the other entity
                tempData = collideWithEntity(dt,ent,ents[i]);

                // Save the collision info if it is the first one or would happen sooner 
                if (entColData.time == 0 || (tempData.time > 0 && tempData.time < entColData.time)) {
                    entColData = tempData;
                }
            }
        }

        // See if there was no collision
        if (groundData.time ==  0 && entColData.time == 0) {
            // Move the entity along its desired path
            ent->setNextPos(ent->getNextPos() + dt*ent->getNextVel());

            // We are done moving for this frame
            return;
        }
        // Otherwise, find the collision that happens first.
        else {
            if ( (groundData.time < entColData.time && groundData.time > 0) || entColData.time == 0 ) {
                // We collided with the ground first, so move the entity and set up for more movement
                ent->setNextPos(ent->getNextPos() + groundData.displacement);
                ent->setNextVel(groundData.velocity);
                dt -= groundData.time;
            }
            else {
                // We collided with another entity first, so move the entity and set up for more movement
                ent->setNextPos(ent->getNextPos() + entColData.displacement);
                ent->setNextVel(entColData.velocity);
                dt -= entColData.time;
            }

            // Collide again to keep moving since we should have time left
            PYR_ASSERT(dt > -0.005, "Error in recursive collision");
            collideEntity(dt,ent,terrain,ents,depth);
        }

        return; 
    }

 }
  
