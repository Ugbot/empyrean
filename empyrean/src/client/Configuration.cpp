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
    
    bool Configuration::isFullscreen() {
        return false;
    }
    
    std::string Configuration::getServer() {
        return "localhost";
    }
    
    u16 Configuration::getPort() {
        return 14702;
    }
    
    std::string Configuration::getUsername() {
        return "aegis";
    }

}
