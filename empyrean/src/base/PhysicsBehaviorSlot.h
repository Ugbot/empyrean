#ifndef PYR_PHYSICS_BEHAVIOR_SLOT_H
#define PYR_PHYSICS_BEHAVIOR_SLOT_H


#include "Behavior.h"


namespace pyr {

    class PhysicsBehaviorSlot : public BehaviorSlot {
    protected:
        ~PhysicsBehaviorSlot() { }

    public:
        // Yay for public fields.  ;)  Put these behind mutators and
        // accessors if need be.

        Inited<int, 1> jumpNumber;
        Vec2f desiredAccel;
        Vec2f appliedForce;
        Inited<bool, true> facingRight;
        Zeroed<float> desiredGroundSpeed;
        Zeroed<float> desiredAirSpeed;
        Inited<bool, true> inAir;
        Vec2f groundDir;
        Vec2f groundNorm;
        Zeroed<float> staticCoeffOfFriction;
        Zeroed<float> dynamicCoeffOfFriction;
        Inited<int,1> mass;
    };
    typedef RefPtr<PhysicsBehaviorSlot> PhysicsBehaviorSlotPtr;

}


#endif
