#ifndef PYR_APPEARANCE_H
#define PYR_APPEARANCE_H


#include <string>


namespace pyr {

    class Appearance {
    public:
        virtual ~Appearance() { }
        // Should getName() and getResource() return std::string instead?
        // It gets rid of the null pointer issue.
        virtual const char* getName() = 0;
        virtual const char* getResource() = 0;

        virtual void sendCommand(const std::string& command) = 0;
        virtual void beginAnimation(const std::string& animation) = 0;
        virtual void beginAnimationCycle(const std::string& animation) = 0;
    };
    
}


#endif
