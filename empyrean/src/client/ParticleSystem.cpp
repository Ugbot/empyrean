#include <SDL_opengl.h>
#include <gmtl/VecOps.h>

#include "ParticleSystem.h"
#include "Texture.h"

namespace pyr {
    ParticleSystem::Particle::Particle(
        const gmtl::Vec2f& pos,
        const gmtl::Vec2f& vel,
        const gmtl::Vec2f& gravity,
        float lifetime,
        const Color& color)
        : _pos(pos)
        , _vel(vel)
        , _gravity(gravity)
        , _lifetime(lifetime)
        , _color(color)
    {
        _colorFade = (1.0f / _lifetime) * _color;
    }

    void ParticleSystem::Particle::update(float dt) {
        _lifetime -= dt;

        _pos += _vel * dt;
        _vel += _gravity * dt;
        _color -= _colorFade * dt;
    }

    ParticleSystem::ParticleSystem() 
        : _gravity(0, 1)
        , _period(0.05f)
        , _spawnCount(0)
        , _particleTex(Texture::create("images/particle.png"))
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

        _spawnCount += dt;
        while (_spawnCount > _period) {
            float x = float(rand()) / RAND_MAX * 5; // arbitrary
            float y = float(rand()) / RAND_MAX * 5;
            x-=2.5;
            y-=2.5;
            _particles.push_back(Particle(gmtl::Vec2f(x, y), gmtl::Vec2f(0, 5), gmtl::Vec2f(0,0), 15, _curColor));
            
            _spawnCount -= _period;
        }

        if (_fadeTime != 0) {
            float f = (_fadeTime > dt) ? dt : _fadeTime;
            _curColor += _colorFade * f;
            _fadeTime -= f;
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
            const float x1 = iter->_pos[0] - particleSize;
            const float y1 = iter->_pos[1] - particleSize;
            const float x2 = x1 + particleSize;
            const float y2 = y1 + particleSize;

            glColor4fv(iter->_color.getData());

            glTexCoord2f(0, 0);  glVertex2f(x1, y1);
            glTexCoord2f(1, 0);  glVertex2f(x2, y1);
            glTexCoord2f(1, 1);  glVertex2f(x2, y2);
            glTexCoord2f(0, 1);  glVertex2f(x1, y2);
        }
        glEnd();
        glColor3f(1, 1, 1);
    }

    const gmtl::Vec2f& ParticleSystem::getGravity() const {
        return _gravity;
    }

    void ParticleSystem::setGravity(const gmtl::Vec2f& gravity) {
        _gravity = gravity;
    }

    const Color& ParticleSystem::getColor() const {
        return _curColor;
    }

    void ParticleSystem::setColor(const Color& c) {
        _curColor = c;
        _fadeTime = 0;
    }

    void ParticleSystem::fadeToColor(const Color& c, float time) {
        _colorFade = (c - _curColor) / time;
        _fadeTime = time;
    }

    float ParticleSystem::getPeriod() const {
        return _period;
    }

    void ParticleSystem::setPeriod(float p) {
        if (p > 0) {
            _period = p;
        }
    }
}
