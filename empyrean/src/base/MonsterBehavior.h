#ifndef PYR_MONSTER_BEHAVIOR_H
#define PYR_MONSTER_BEHAVIOR_H


#include "PhysicsBehavior.h"


namespace pyr {

    class MonsterBehavior : public PhysicsBehavior {
    public:
        PYR_BEHAVIOR_NAME("monster");
        
        MonsterBehavior(const std::string& /*resource*/) {
        }

        std::string getResource() { return ""; }

        void update(Entity* entity, float dt, const Environment& env);

    private:
    };

}


#endif
