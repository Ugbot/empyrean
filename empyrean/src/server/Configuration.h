#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include "Singleton.h"


namespace pyr {

    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)
        
        Configuration()  { }
        ~Configuration() { }
        
    public:
        int getServerPort();
        bool shouldStartServer();
    };

}


#endif
