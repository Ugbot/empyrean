#ifndef PYR_PHYSICS_BEHAVIOR_H
#define PYR_PHYSICS_BEHAVIOR_H


#include "Behavior.h"


namespace pyr {
    
	/**
	 * Can't be directly instantiated.  Derived this from if you want to
	 * be considered in the physics engine.
	 */
	class PhysicsBehavior : public Behavior {
	public:
        bool facingRight() const { return _facingRight; }
        const Vec2f& getDesiredAccel() const { return _desiredAccel; }
        float getDesiredGroundSpeed() const { return _desiredGroundSpeed; }
        int getJumpNumber() const { return _jumping; }

	protected:
        Vec2f& getDesiredAccel() { return _desiredAccel; }
		int& getJumping() { return _jumping; }

		void setFacingRight(bool right) { _facingRight = right; }
		void setDesiredAccel(Vec2f v) { _desiredAccel = v; }
		void setDesiredGroundSpeed(float s) { _desiredGroundSpeed = s; }
		void setJumpNumber(int n) { _jumping = n; }

	private:
        Inited<int, 1> _jumping;
        Vec2f _desiredAccel;
        Inited<bool, true> _facingRight;
        Zeroed<float> _desiredGroundSpeed;
	};

}


#endif
