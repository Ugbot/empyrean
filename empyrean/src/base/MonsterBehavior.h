#ifndef PYR_MONSTER_BEHAVIOR_H
#define PYR_MONSTER_BEHAVIOR_H


#include "Behavior.h"


namespace pyr {

    class MonsterBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("monster");

        MonsterBehavior(const std::string& /*resource*/) {
        }

        std::string getResource() { return ""; }

        void update(Entity* entity, float dt, const Environment& env);
    };

}


#endif
