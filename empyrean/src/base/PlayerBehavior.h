#ifndef PYR_PLAYER_BEHAVIOR_H
#define PYR_PLAYER_BEHAVIOR_H


#include "Behavior.h"
#include "Utility.h"
#include "UnownedPtr.h"


namespace pyr {

    class PhysicsBehaviorSlot;

    class PlayerBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("player");

        PlayerBehavior(const std::string& resource);

        void update(Entity* entity, float dt, const Environment& env);

        std::string getResource() {
            return "";
        }

        void handleEvent(Entity* entity, const std::string& event);
        
        bool facingRight() const;
        
    private:
        UnownedPtr<PhysicsBehaviorSlot> _physics;
    };

}


#endif
