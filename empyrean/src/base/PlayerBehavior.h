#ifndef PYR_PLAYER_BEHAVIOR_H
#define PYR_PLAYER_BEHAVIOR_H


#include "Behavior.h"


namespace pyr {

    class PlayerBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("player");

        PlayerBehavior(const std::string& /*resource*/) {
        }

        void update(Entity* entity, float dt, const Map* map);

        const char* getResource() {
            return "";
        }
    };

}


#endif
