#ifndef PYR_PARTICLESYSTEM_H
#define PYR_PARTICLESYSTEM_H

#include <list>

#include "Color.h"
#include "Entity.h"
#include "Types.h"
#include "VecMath.h"

namespace pyr {
    class Texture;

    class ParticleSystem : public Entity {
    public:
        ParticleSystem();

        virtual void update(float dt, const Map* terrain);
        virtual void draw();

        void spawnParticle(const Vec2f& pos,
                           const Vec2f& vel,
                           const Vec2f& acceleration,
                           float lifetime,
                           const Color& color);

    private:
        struct Particle {
            friend class ParticleSystem;

        protected:
            Vec2f _pos;
            Vec2f _vel;
            Vec2f _accel;
            Color _color;
            Color _colorFade; ///< Subtract this from the color every second
            float _lifetime;  ///< Your days are numbered, yo   

            Particle(const Vec2f& pos,
                     const Vec2f& vel,
                     const Vec2f& acceleration,
                     float lifetime,
                     const Color& color);

            void update(float dt);
        };


        typedef std::list<Particle> ParticleList;
        ParticleList _particles;
        Texture*     _particleTex;
    };
}

#endif
