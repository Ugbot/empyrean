#ifndef PYR_AUDIO_SYSTEM_H
#define PYR_AUDIO_SYSTEM_H


#include <map>
#include <audiere.h>
#include "Singleton.h"
#include "Types.h"


namespace pyr {

    class AudioSystem {
    private:
        PYR_DECLARE_SINGLETON(AudioSystem)

        AudioSystem();
    
    public:
        void playMusic(const string& music);
        void playSound(const string& sound);

    private:
        audiere::AudioDevicePtr _device;
        audiere::OutputStreamPtr _music;
        std::map<string, audiere::SoundEffectPtr> _sounds;
    };

}


#endif
