#ifndef PYR_PHYSICS_BEHAVIOR_SLOT_H
#define PYR_PHYSICS_BEHAVIOR_SLOT_H


#include "Behavior.h"


namespace pyr {

    class PhysicsBehaviorSlot : public BehaviorSlot {
    public:
        // Yay for public fields.  ;)  Put these behind mutators and
        // accessors if need be.

        Inited<int, 1> jumpNumber;
        Vec2f desiredAccel;
        Inited<bool, true> facingRight;
        Zeroed<float> desiredGroundSpeed;
    };

}


#endif
