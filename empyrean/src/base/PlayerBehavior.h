#ifndef PYR_PLAYER_BEHAVIOR_H
#define PYR_PLAYER_BEHAVIOR_H


#include "PhysicsBehavior.h"
#include "Utility.h"


namespace pyr {

    class PlayerBehavior : public PhysicsBehavior {
    public:
        PYR_BEHAVIOR_NAME("player");

        PlayerBehavior(const std::string& resource);

        void update(Entity* entity, float dt, const Environment& env);

        std::string getResource() {
            return "";
        }

        void handleEvent(Entity* entity, const std::string& event);
    };

}


#endif
