#ifndef PYR_PARTICLE_GROUP_H
#define PYR_PARTICLE_GROUP_H

#include <vector>
#include "Particle.h"

namespace pyr {

    class ParticleGroup {
    public:
        typedef std::vector<Particle> ParticleList;

        void addParticle(const Particle& p) {
            _particles.push_back(p);
        }

        void update(float dt, const Vec3f& accel, const std::vector<Segment>& segs);

        const ParticleList& getParticles() const {
            return _particles;
        }

    private:
        ParticleList _particles;
    };

}

#endif
