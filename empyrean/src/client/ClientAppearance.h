#ifndef PYR_CLIENT_APPEARANCE_H
#define PYR_CLIENT_APPEARANCE_H


#include "Appearance.h"


namespace pyr {

    class ClientAppearance : public Appearance {
    public:
        virtual void draw() = 0;
        virtual void update(float dt) = 0;
    };

}


#endif
