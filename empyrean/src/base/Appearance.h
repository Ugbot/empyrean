#ifndef PYR_APPEARANCE_H
#define PYR_APPEARANCE_H


#include <string>


namespace pyr {

    class Appearance {
    public:
        virtual ~Appearance() { }
        virtual const char* getName() = 0;
        virtual const char* getResource() = 0;
        virtual void update(float dt) = 0;
        virtual void draw() = 0;
    };
    
}


#endif
