#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include <string>
#include "Singleton.h"


namespace pyr {

    /// Immutable for now.
    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)

        Configuration()  { }
        ~Configuration() { }
        
    public:
        int getScreenWidth();
        int getScreenHeight();
        bool isFullscreen();
        
        std::string getServer();
        int getPort();
        
        std::string getUsername();
    };

}


#endif
