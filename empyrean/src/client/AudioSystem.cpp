#include <stdexcept>
#include "AudioSystem.h"
#include "Log.h"


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.AudioSystem");
    }

    PYR_DEFINE_SINGLETON(AudioSystem);

    AudioSystem::AudioSystem() {
        PYR_LOG_SCOPE(_logger, INFO, "AudioSystem::AudioSystem");

        _device = audiere::OpenDevice();
        if (!_device) {
            PYR_LOG(_logger, WARN) << "Could not open audio device";
            _device = audiere::OpenDevice("null");
            if (!_device) {
                throw std::runtime_error("Could not open any audio device.");
            }
        }
    }

    void AudioSystem::playMusic(const string& filename) {
        PYR_LOG_SCOPE(_logger, INFO, "AudioSystem::playMusic");

        _music = audiere::OpenSound(_device, filename.c_str(), true);
        if (!_music) {
            PYR_LOG(_logger, WARN) << "Could not open music file: " << filename;
            throw std::runtime_error("Could not open music file: " + filename);
        }
        _music->play();
    }

    void AudioSystem::playSound(const string& filename) {
        PYR_LOG_SCOPE(_logger, INFO, "AudioSystem::playSound");

        audiere::SoundEffectPtr effect = _sounds[filename];
        if (!effect) {
            effect = audiere::OpenSoundEffect(_device, filename.c_str(), audiere::MULTIPLE);
            if (!effect) {
                PYR_LOG(_logger, WARN) << "Could not open sound file: " << filename;
                throw std::runtime_error("Could not open sound file: " + filename);
            }
        }
        effect->play();
    }

}
