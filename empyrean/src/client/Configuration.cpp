#include <stdlib.h>
#include "Configuration.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(Configuration)
    
    int Configuration::getScreenWidth() {
        return 1024;
    }
    
    int Configuration::getScreenHeight() {
        return 768;
    }
    
    std::string Configuration::getServer() {
        return "localhost";
    }
    
    int Configuration::getPort() {
        return 14702;
    }
    
    std::string Configuration::getUsername() {
        return "aegis";
    }

}
