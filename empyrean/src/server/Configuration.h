#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include "Singleton.h"
#include "Types.h"


namespace pyr {

    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)
        
        Configuration()  { }
        ~Configuration() { }
        
    public:
        u16 getServerPort();
        bool shouldStartServer();
    };

}


#endif
