#ifndef PYR_CAL3D_APPEARANCE_H
#define PYR_CAL3D_APPEARANCE_H


#include "Appearance.h"
#include "Model.h"
#include "ScopedPtr.h"


namespace pyr {

    class Cal3DAppearance : public Appearance {
    public:
        Cal3DAppearance(const std::string& resource);

        const char* getName() {
            return "cal3d";
        }

        const char* getResource() {
            return _resource.c_str();
        }

        void update(float dt);
        void draw();

    private:
        std::string _resource;
        ScopedPtr<Model> _model;
    };

}


#endif
