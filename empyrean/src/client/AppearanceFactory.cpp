#include "Cal3DAppearance.h"
#include "ClientAppearance.h"


namespace pyr {

    class EmptyAppearance : public ClientAppearance {
    public:
        EmptyAppearance(const std::string& /*resource*/) {
        }

        const char* getName() {
            return "empty";
        }
        
        const char* getResource() {
            return "";
        }
        
        void update(float /*dt*/) {
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

    ClientAppearance* instantiateAppearance(const std::string& name, const std::string& resource) {
        if (name == "cal3d") {
            return new Cal3DAppearance(resource);
        } else {
            return new EmptyAppearance(resource);
        }
    }

}
