#ifndef PYR_PARTICLESYSTEM_H
#define PYR_PARTICLESYSTEM_H

#include <gmtl/Vec.h>
#include <list>

#include "Color.h"
#include "Entity.h"
#include "Types.h"

namespace pyr {
    class Texture;

    class ParticleSystem : public Entity {
    public:
        ParticleSystem();

        virtual void update(float dt);
        virtual void draw();

        const gmtl::Vec2f& getGravity() const;
        void setGravity(const gmtl::Vec2f& v);

        const Color& getColor() const;
        void setColor(const Color& c);
        void fadeToColor(const Color& c, float time);

        float getPeriod() const;
        void setPeriod(float p);

    private:
        struct Particle {
            gmtl::Vec2f _pos;
            gmtl::Vec2f _vel;
            gmtl::Vec2f _gravity;
            Color       _color;
            Color       _colorFade;    ///< Subtract this from the color every second
            float       _lifetime;

            Particle(const gmtl::Vec2f& pos,
                     const gmtl::Vec2f& vel,
                     const gmtl::Vec2f& gravity,
                     float lifetime,
                     const Color& color);

            void update(float dt);
        };


        typedef std::list<Particle> ParticleList;
        ParticleList _particles;
        Texture*     _particleTex;

        Color        _curColor;     ///< Current colour of spawned particles
        Color        _colorFade;    ///< Delta-colour thingo.  We add this to _curColor every second, until...
        float        _fadeTime;     ///< ... this value is zero

        gmtl::Vec2f  _gravity;     
        float        _period;       ///< Period between particle spawnings
        float        _spawnCount;   ///< time left before it's time to spawn another particle
    };
}

#endif
