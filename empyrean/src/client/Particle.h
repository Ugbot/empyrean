#ifndef PYR_PARTICLE_H
#define PYR_PARTICLE_H

#include "Collider.h"
#include "VecMath.h"

namespace pyr {

    class Particle {
    public:
        Particle();
        Particle(float lifeTime, Vec3f pos, Vec3f vel = Vec3f(0,0,0));

        // Reduce the particle lifetime and update state if desired (as directed by second argument)
        void update(float dt, const Vec3f& accel, const std::vector<Segment>& segs);

        // Accessors
        Vec3f pos()   const  { return _position; }
        Vec3f vel()   const  { return _velocity; }
        Vec3f oldPos() const { return _oldPosition; }

        float getLifeLeft() const { return _lifeLeft; }
        bool  isAlive()     const { return getLifeLeft() > 0; }

    protected:
        Vec3f _position;
        Vec3f _velocity;
        Vec3f _oldPosition;
        Vec3f _oldVelocity;
        float _lifeLeft;
    };

}

#endif
