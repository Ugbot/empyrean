#ifndef PYR_MONSTER_BEHAVIOR_H
#define PYR_MONSTER_BEHAVIOR_H


#include "Behavior.h"
#include "UnownedPtr.h"

namespace pyr {

    class PhysicsBehaviorSlot;

    class MonsterBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("monster");

        MonsterBehavior(const std::string& /*resource*/); 

        std::string getResource() { return ""; }

        void update(Entity* entity, float dt, const Environment& env);
            
    private:
        UnownedPtr<PhysicsBehaviorSlot> _physics;
    };

}


#endif
