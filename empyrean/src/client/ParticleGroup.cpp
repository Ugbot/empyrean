#include "ParticleGroup.h"

namespace pyr {

    void ParticleGroup::update(float dt, const Vec3f& accel, const std::vector<Segment>& segs) {
        for (size_t i = 0; i < _particles.size(); ++i) {
            _particles[i].update(dt, accel, segs);

            // Remove dead particles
            if (!_particles[i].isAlive()) {
                _particles[i] = _particles[_particles.size() - 1];
                _particles.resize(_particles.size() - 1);
                --i;
	    }
        }
    }

}
