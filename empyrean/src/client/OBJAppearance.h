#ifndef PYR_OBJ_APPEARANCE_H
#define PYR_OBJ_APPEARANCE_H


#include "ClientAppearance.h"
#include "Map.h"
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
        ScopedPtr<Map> _map;
        Zeroed<float> _time;
    };

}


#endif
