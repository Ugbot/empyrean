#include <stdlib.h>
#include "Configuration.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Configuration)

    int Configuration::getServerPort() {
        return 8765;
    }
    
    bool Configuration::shouldStartServer() {
        return true;
    }

}
