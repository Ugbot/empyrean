#include "Environment.h"
#include "GLUtility.h"
#include "OpenGL.h"
#include "ParticleSystem.h"
#include "Profiler.h"
#include "Texture.h"

namespace pyr {

    struct Domain {
        virtual Vec3f generate() = 0;
    };

    struct SphereDomain : Domain {
        Vec3f generate() {
            for (;;) {
                Vec3f v(
                    randf() * 2 - 1,
                    randf() * 2 - 1,
                    randf() * 2 - 1);
                if (lengthSquared(v) <= 1) {
                    return v;
                }
            }
        }
    };

    ParticleSystem::ParticleSystem(const string& resource)
    : _resource(resource)
    , _texture(Texture::create("images/smoke.png")) {
    }


    void ParticleSystem::smoke(float dt, const Environment& env) {
        _group.update(dt, Vec3f(), std::vector<Segment>());

        SphereDomain sphere;

        float rate = 50;  // Particles per second.
        float invRate = 1.0f / rate;
        while (_time >= invRate) {
            Vec3f vel(randf() * 0.2f - 0.1f, 0.4f, 0);
            vel[1] -= fabs(vel[0]) / 2;
            Particle p(5, sphere.generate() / 5, vel);
            _group.addParticle(p);
            _time -= invRate;
        }
    }

    void ParticleSystem::sparks(float dt, const Environment& env) {
        std::vector<Segment> segs;
        env.map->getSegs(segs, 31);  // @todo !!!  Need to get real entity position.

        _group.update(dt, Vec3f(0, -9.81f, 0), segs);

        SphereDomain sphere;
        
        while (_time > 5) {
            for (int i = 0; i < 40; ++i) {
                Particle p(5, Vec3f(), sphere.generate());
                _group.addParticle(p);
            }
            _time -= 5;
        }
    }

    void ParticleSystem::update(float dt, const Environment& env) {
        PYR_PROFILE_BLOCK("ParticleSystem::update");

        _time += dt;

        if (_resource == "smoke") {
            smoke(dt, env);
        } else if (_resource == "sparks") {
            sparks(dt, env);
        }
    }

    void ParticleSystem::draw() {
        PYR_PROFILE_BLOCK("ParticleSystem::draw");

        if (_resource == "smoke") {
            glColor3f(1, 1, 1);
            glDisable(GL_DEPTH_TEST);
            glDisable(GL_LIGHTING);
            _texture->bind();
            glEnable(GL_TEXTURE_2D);
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

            float off = 0.1f;

            glBegin(GL_QUADS);
            const ParticleGroup::ParticleList& particles = _group.getParticles();
            for (size_t i = 0; i < particles.size(); ++i) {
                const Particle& p = particles[particles.size() - i - 1];
                float alpha = (p.getLifeLeft() < 2.5f
                    ? p.getLifeLeft() / 2.5f
                    : (5 - p.getLifeLeft()) / 2.5f);
                glColor4f(1, 1, 1, alpha);
                glTexCoord2f(0, 0); glVertex(p.pos() + Vec3f(-off,  off, 0));
                glTexCoord2f(0, 1); glVertex(p.pos() + Vec3f(-off, -off, 0));
                glTexCoord2f(1, 1); glVertex(p.pos() + Vec3f( off, -off, 0));
                glTexCoord2f(1, 0); glVertex(p.pos() + Vec3f( off,  off, 0));
            }
            glEnd();

            glDisable(GL_BLEND);
            glDisable(GL_TEXTURE_2D);
            glBindTexture(GL_TEXTURE_2D, 0);
            glEnable(GL_LIGHTING);
            glEnable(GL_DEPTH_TEST);
        } else if (_resource == "sparks") {
            glDisable(GL_DEPTH_TEST);
            glDisable(GL_LIGHTING);

            float off = 0.1f;

            glBegin(GL_LINES);
            const ParticleGroup::ParticleList& particles = _group.getParticles();
            for (size_t i = 0; i < particles.size(); ++i) {
                const Particle& p = particles[particles.size() - i - 1];
                float alpha = (p.getLifeLeft() < 2.5f
                    ? p.getLifeLeft() / 2.5f
                    : (5 - p.getLifeLeft()) / 2.5f);
                glColor4f(1, 0.8f, 0, alpha);
                glVertex(p.pos() - p.vel() / 80);
                glVertex(p.pos() + p.vel() / 80);
            }
            glEnd();

            glEnable(GL_LIGHTING);
            glEnable(GL_DEPTH_TEST);
        }
    }

}
