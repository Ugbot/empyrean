#ifndef PYR_PLAYER_BEHAVIOR_H
#define PYR_PLAYER_BEHAVIOR_H


#include "Behavior.h"
#include "Utility.h"


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

        void handleEvent(Entity* entity, const std::string& event);

    private:
        Zeroed<int> _jumping;
    };

}


#endif
