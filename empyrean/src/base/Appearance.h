#ifndef PYR_APPEARANCE_H
#define PYR_APPEARANCE_H


#include <string>
#include "Types.h"


namespace pyr {

    class Appearance {
    public:
        virtual ~Appearance() { }

        virtual string getName() = 0;
        virtual string getResource() = 0;

        virtual void sendCommand(const string& command) = 0;
        virtual void beginAnimation(const string& animation) = 0;
        virtual void beginAnimationCycle(const string& animation) = 0;
    };
    
}


#endif
