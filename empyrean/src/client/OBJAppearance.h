#ifndef PYR_OBJ_APPEARANCE_H
#define PYR_OBJ_APPEARANCE_H


#include "ClientAppearance.h"
#include "MapElement.h"
#include "ScopedPtr.h"


namespace pyr {

    class OBJAppearance : public ClientAppearance {
    public:
        OBJAppearance(const string& resource);
        
        string getName() {
            return "obj";
        }

        string getResource() {
            return _resource;
        }

        void sendCommand(const std::string& command);
        void beginAnimation(const std::string& animation);
        void beginAnimationCycle(const std::string& animation);

        void update(float dt);
        void draw();
    
    private:
        string _resource;
        MapElementPtr _model;
        Zeroed<float> _time;
    };

}


#endif
