#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include <string>
#include "Singleton.h"


namespace pyr {

    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)

        Configuration()  { }
        ~Configuration() { }
        
    public:
        // immutable for now
        int getScreenWidth();
        int getScreenHeight();
        
        std::string getServer();
        int getPort();
        
        std::string getUsername();
    };

}


#endif
