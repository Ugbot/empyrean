#ifndef PYR_APPEARANCE_H
#define PYR_APPEARANCE_H


#include <string>
#include "RefCounted.h"
#include "RefPtr.h"
#include "Types.h"


namespace pyr {

    class Appearance : public RefCounted {
    protected:
        ~Appearance() { }

    public:
        virtual string getName() = 0;
        virtual string getResource() = 0;

        virtual void sendCommand(const string& command) = 0;
        virtual void beginAnimation(const string& animation) = 0;
        virtual void beginAnimationCycle(const string& animation) = 0;
    };
    PYR_REF_PTR(Appearance);
    
}


#endif
