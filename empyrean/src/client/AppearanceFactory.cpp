#include "Appearance.h"
#include "Cal3DAppearance.h"


namespace pyr {

    class EmptyAppearance : public Appearance {
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
    };

    Appearance* instantiateAppearance(const std::string& name, const std::string& resource) {
        if (name == "cal3d") {
            return new Cal3DAppearance(resource);
        } else {
            return new EmptyAppearance(resource);
        }
    }

}
