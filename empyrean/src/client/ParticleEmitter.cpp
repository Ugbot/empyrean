#include <gmtl/VecOps.h>

#include "ParticleEmitter.h"
#include "ParticleSystem.h"

namespace pyr {

    ParticleEmitter::ParticleEmitter(ParticleSystem* system)
        : _system(system)
        , _curColor(1, 1, 1, 1)
        , _velocity(0, 0)
        , _transformTime(0)
        , _period(0.33f)
        , _spawnCount(0)
        , _lifeTime(3.0f)
    {
    }

    void ParticleEmitter::update(float dt, const Map* /*terrain*/) {

        if (_period != 0) {
            _spawnCount += dt;
            while (_spawnCount > _period) {
                _system->spawnParticle(getPos(), _velocity, _accel, _lifeTime, _curColor);

                _spawnCount -= _period;
            }
        }

        if (_transformTime) {
            float f = (dt < _transformTime) ? dt : _transformTime;
            _curColor += _colorTransform * f;
            _transformTime -= f;
        }
    }

    void ParticleEmitter::draw() {
        // no-op
    }

    const Color& ParticleEmitter::getColor() const {
        return _curColor;
    }

    void ParticleEmitter::setColor(const Color& color) {
        _curColor = color;
        _transformTime = 0;
    }

    void ParticleEmitter::fadeToColor(const Color& color,float time) {
        _colorTransform = (color - _curColor) * (1 / time);
        _transformTime = time;
    }

    const gmtl::Vec2f& ParticleEmitter::getAccel() const {
        return _accel;
    }

    void ParticleEmitter::setAccel(const gmtl::Vec2f& accel) {
        _accel = accel;
    }

    const gmtl::Vec2f& ParticleEmitter::getVelocity() const {
        return _velocity;
    }

    void ParticleEmitter::setVelocity(const gmtl::Vec2f& velocity) {
        _velocity = velocity;
    }

    float ParticleEmitter::getLifeTime() const {
        return _lifeTime;
    }

    void ParticleEmitter::setLifeTime(float lifetime) {
        _lifeTime = lifetime;
    }

    float ParticleEmitter::getPeriod() const {
        return _period;
    }

    void ParticleEmitter::setPeriod(float period) {
        _period = period;
        if (_period < 0)
            _period = 0;
    }
}
