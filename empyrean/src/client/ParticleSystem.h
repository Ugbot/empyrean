#ifndef PYR_PARTICLE_SYSTEM_H
#define PYR_PARTICLE_SYSTEM_H


#include "ClientAppearance.h"
#include "ParticleGroup.h"


namespace pyr {

    class Environment;
    class Texture;

    /// @todo Rename to ParticleAppearance.
    class ParticleSystem : public ClientAppearance {
    protected:
        ~ParticleSystem() { }

    public:
        string getName()     { return "particle"; }
        string getResource() { return _resource;  }

        ParticleSystem(const string& resource);

        void update(float dt, const Environment& env);
        void draw();

        void sendCommand(const string& command) { };
        void beginAnimation(const string& animation) { };
        void beginAnimationCycle(const string& animation) { };

    private:
        void smoke(float dt, const Environment& env);
        void sparks(float dt, const Environment& env);

        string        _resource;
        Zeroed<float> _time;
        ParticleGroup _group;

        Texture* _texture;
    };
}

#endif
