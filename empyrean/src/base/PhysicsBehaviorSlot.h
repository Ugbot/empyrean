#ifndef PYR_PHYSICS_BEHAVIOR_SLOT_H
#define PYR_PHYSICS_BEHAVIOR_SLOT_H


#include "Behavior.h"


namespace pyr {

    class PhysicsBehaviorSlot : public BehaviorSlot {
    protected:
        ~PhysicsBehaviorSlot() { }

    public:
        PhysicsBehaviorSlot() {
            jumpNumber = 1;
            facingRight = true;
            desiredGroundSpeed = 0;
            desiredAirSpeed = 0;
            inAir = true;
        }

        // Yay for public fields.  ;)  Put these behind mutators and
        // accessors if need be.

        int jumpNumber;
        Vec2f desiredAccel;
        Vec2f appliedForce;
        bool facingRight;
        float desiredGroundSpeed;
        float desiredAirSpeed;
        bool inAir;
        Vec2f groundDir;
        Vec2f groundNorm;
        Zeroed<float> staticCoeffOfFriction;
        Zeroed<float> dynamicCoeffOfFriction;
        Inited<int,1> mass;
    };
    PYR_REF_PTR(PhysicsBehaviorSlot);

}


#endif
