#ifndef PYR_PLAYER_BEHAVIOR_H
#define PYR_PLAYER_BEHAVIOR_H


#include "Behavior.h"
#include "Utility.h"


namespace pyr {

    class PlayerBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("player");

        PlayerBehavior(const std::string& resource);

        void update(Entity* entity, float dt, const Environment& env);

        std::string getResource() {
            return "";
        }

        void handleEvent(Entity* entity, const std::string& event);

        bool facingRight() { return _facingRight; }

    private:
        Zeroed<int> _jumping;
        Zeroed<float> _desiredVelocity;
        bool _facingRight;
    };

}


#endif
