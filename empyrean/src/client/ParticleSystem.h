#ifndef PYR_PARTICLESYSTEM_H
#define PYR_PARTICLESYSTEM_H

#include <list>

#include <gmtl/Vec.h>

#include "Color.h"
#include "Entity.h"
#include "Types.h"

namespace pyr {
    class Texture;

    class ParticleSystem : public Entity {
    public:
        ParticleSystem();

        virtual void update(float dt, const Map* terrain);
        virtual void draw();

        void spawnParticle(const gmtl::Vec2f& pos,
                           const gmtl::Vec2f& vel,
                           const gmtl::Vec2f& acceleration,
                           float lifetime,
                           const Color& color);

    private:
        struct Particle {
            friend class ParticleSystem;

        protected:
            gmtl::Vec2f _pos;
            gmtl::Vec2f _vel;
            gmtl::Vec2f _accel;
            Color       _color;
            Color       _colorFade; ///< Subtract this from the color every second
            float       _lifetime;  ///< Your days are numbered, yo   

            Particle(const gmtl::Vec2f& pos,
                     const gmtl::Vec2f& vel,
                     const gmtl::Vec2f& acceleration,
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
