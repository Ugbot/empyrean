#include <stdlib.h>
#include "Configuration.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Configuration)

    u16 Configuration::getServerPort() {
        return 14702;
    }
    
    bool Configuration::shouldStartServer() {
        return true;
    }

}
