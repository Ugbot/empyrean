#include "Log.h"

#include "Cal3DAppearance.h"
#include "ClientAppearance.h"
#include "OBJAppearance.h"
#include "ParticleSystem.h"


namespace pyr {

    namespace {

        Logger& _logger = Logger::get("pyr.AppearanceFactory");

    }

    class EmptyAppearance : public ClientAppearance {
    public:
        EmptyAppearance(const std::string& /*resource*/) {
        }

        std::string getName() {
            return "empty";
        }
        
        std::string getResource() {
            return "";
        }
        
        void update(float /*dt*/, const Environment& env) {
        }

        void draw() {
        }

        void sendCommand(const std::string& command) {
        }

        void beginAnimation(const std::string& animation) {
        }

        void beginAnimationCycle(const std::string& animation) {
        }
    };

    ClientAppearance* instantiateAppearance(const string& name, const string& resource) {
        if (name == "cal3d") {
            return new Cal3DAppearance(resource);
        } else if (name == "obj") {
            return new OBJAppearance(resource);
        } else if (name == "particle") {
            return new ParticleSystem(resource);
        } else {
            PYR_LOG(_logger, WARN, "Unknown appearance name: " << name);
            return new EmptyAppearance(resource);
        }
    }

}
