#ifndef PYR_CAL3D_APPEARANCE_H
#define PYR_CAL3D_APPEARANCE_H


#include "ClientAppearance.h"
#include "Model.h"
#include "ScopedPtr.h"


namespace pyr {

    class Cal3DAppearance : public ClientAppearance {
    public:
        Cal3DAppearance(const std::string& resource);

        std::string getName() {
            return "cal3d";
        }

        std::string getResource() {
            return _resource;
        }

        void sendCommand(const std::string& command);
        void beginAnimation(const std::string& animation);
        void beginAnimationCycle(const std::string& animation);

        void update(float dt);
        void draw();

    private:
        std::string _resource;
        ScopedPtr<Model> _model;
        Zeroed<float> _direction;
    };

}


#endif
