#ifndef PYR_SERVER_APPEARANCE_H
#define PYR_SERVER_APPEARANCE_H

#include "Appearance.h"

namespace pyr {

    class ServerAppearance : public Appearance {
    public:
        ServerAppearance(const std::string& name, const std::string& resource) {
            _name = name;
            _resource = resource;
        }
        
        const char* getName() {
            return _name.c_str();
        }
        
        const char* getResource() {
            return _resource.c_str();
        }
        
        void update(float /*dt*/) {
            // Send appearance commands to the client.
        }

        void draw() {
            // Is there a way we can get rid of this method?
        }
        
    private:
        std::string _name;
        std::string _resource;
    };

}


#endif
