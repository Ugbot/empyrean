#ifndef PYR_CLIENT_APPEARANCE_H
#define PYR_CLIENT_APPEARANCE_H


#include "Appearance.h"


namespace pyr {

    class Environment;

    class ClientAppearance : public Appearance {
    protected:
        ~ClientAppearance() { }

    public:
        virtual void draw() = 0;
        virtual void update(float dt, const Environment& env) = 0;
    };
    PYR_REF_PTR(ClientAppearance);

}


#endif
