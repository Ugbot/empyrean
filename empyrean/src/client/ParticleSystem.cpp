#include <SDL_opengl.h>
#include <gmtl/VecOps.h>

#include "ParticleSystem.h"
#include "Texture.h"

namespace pyr {
    ParticleSystem::Particle::Particle(
        const gmtl::Vec2f& pos,
        const gmtl::Vec2f& vel,
        const gmtl::Vec2f& acceleration,
        float lifetime,
        const Color& color)
        : _pos(pos)
        , _vel(vel)
        , _accel(acceleration)
        , _lifetime(lifetime)
        , _color(color)
    {
        _colorFade[3] = (1.0f / _lifetime) * _color[3];
    }

    void ParticleSystem::Particle::update(float dt) {
        _lifetime -= dt;

        _pos += _vel * dt;
        _vel += _accel * dt;
        _color -= _colorFade * dt;
    }

    ParticleSystem::ParticleSystem() 
        : _particleTex(Texture::create("images/particle.png"))
    {
    }

    void ParticleSystem::update(float dt) {
        for (ParticleList::iterator iter = _particles.begin(); iter != _particles.end(); iter++) {
            iter->update(dt);

            if (iter->_lifetime <= 0) {
                ParticleList::iterator i = iter;    // save the spot we're at
                iter--;                             // and move back one, because the spot we were at is...
                _particles.erase(i);                // ... toast.
                continue;                           // and continue on our merry way
            }
        }
    }

    void ParticleSystem::draw() {
        static const float particleSize = 5;

        glEnable(GL_TEXTURE_2D);
        glEnable(GL_COLOR_MATERIAL);
        glEnable(GL_BLEND);
        _particleTex->bind();

        glBegin(GL_QUADS);
        for (ParticleList::iterator iter = _particles.begin(); iter != _particles.end(); iter++) {
            const float x1 = iter->_pos[0] - particleSize / 2;
            const float y1 = iter->_pos[1] - particleSize / 2;
            const float x2 = iter->_pos[0] + particleSize / 2;
            const float y2 = iter->_pos[1] + particleSize / 2;

            glColor4fv(iter->_color.getData());

            glTexCoord2f(0, 0);  glVertex2f(x1, y1);
            glTexCoord2f(1, 0);  glVertex2f(x2, y1);
            glTexCoord2f(1, 1);  glVertex2f(x2, y2);
            glTexCoord2f(0, 1);  glVertex2f(x1, y2);
        }
        glEnd();
        glColor4f(1, 1, 1, 1);
    }

    void ParticleSystem::spawnParticle(const gmtl::Vec2f& pos,
                                       const gmtl::Vec2f& vel,
                                       const gmtl::Vec2f& acceleration,
                                       float lifetime,
                                       const Color& color) {
        _particles.push_back(Particle(pos, vel, acceleration, lifetime, color));
    }
}
