#ifndef PYR_PARTICLEEMITTER_H
#define PYR_PARTICLEEMITTER_H

#include "ClientEntity.h"
#include "Color.h"
#include "VecMath.h"

namespace pyr {

    class ParticleSystem;

    class ParticleEmitter : public ClientEntity {
    public:
        ParticleEmitter(ParticleSystem* system);

        virtual void update(float dt, const Map* terrain);
        virtual void draw();

        const Color&    getColor() const;
        void setColor(const Color& color);
        void fadeToColor(const Color& color,float time);

        const Vec2f& getAccel() const;
        void setAccel(const Vec2f& accel);

        const Vec2f& getVelocity() const;
        void setVelocity(const Vec2f& velocity);

        float getLifeTime() const;
        void setLifeTime(float lifetime);

        float getPeriod() const;
        void setPeriod(float period);

    private:
        ParticleSystem* _system;
        Color           _curColor;

        Vec2f _velocity;          ///< new particles are given this velocity vector ...
        Vec2f _accel;             ///< and this acceleration

        Color _colorTransform;    ///< _curColor is multiplied by this every second...
        float _transformTime;     ///< ...until this reaches zero

        float _period;            ///< How long to wait before spawning another particle
        float _spawnCount;        ///< when this reaches zero, we spawn.

        float _lifeTime;          ///< Lifetime for spawned particles
    };
}

#endif
