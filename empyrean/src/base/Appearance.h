#ifndef PYR_APPEARANCE_H
#define PYR_APPEARANCE_H


#include <string>


namespace pyr {

    class Appearance {
    public:
        virtual ~Appearance() { }
        virtual const char* getName() = 0;
        virtual void update(float dt) = 0;
    };

}


#endif
