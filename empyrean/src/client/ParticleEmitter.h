#ifndef PYR_PARTICLEEMITTER_H
#define PYR_PARTICLEEMITTER_H

#include <gmtl/Vec.h>

#include "Entity.h"
#include "Color.h"

namespace pyr {

    class ParticleSystem;

    class ParticleEmitter : public Entity {
    public:
        ParticleEmitter(ParticleSystem* system);

        virtual void update(float dt);
        virtual void draw();

        const Color&    getColor() const;
        void setColor(const Color& color);
        void fadeToColor(const Color& color,float time);

        const gmtl::Vec2f& getAccel() const;
        void setAccel(const gmtl::Vec2f& accel);

        const gmtl::Vec2f& getVelocity() const;
        void setVelocity(const gmtl::Vec2f& velocity);

        float getLifeTime() const;
        void setLifeTime(float lifetime);

        float getPeriod() const;
        void setPeriod(float period);

    private:
        ParticleSystem* _system;
        Color           _curColor;

        gmtl::Vec2f     _velocity;          ///< new particles are given this velocity vector ...
        gmtl::Vec2f     _accel;             ///< and this acceleration

        Color           _colorTransform;    ///< _curColor is multiplied by this every second...
        float           _transformTime;     ///< ...until this reaches zero

        float           _period;            ///< How long to wait before spawning another particle
        float           _spawnCount;        ///< when this reaches zero, we spawn.

        float           _lifeTime;          ///< Lifetime for spawned particles
    };
}

#endif