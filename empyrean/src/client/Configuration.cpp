#include <stdlib.h>
#include "Configuration.h"


namespace pyr {

    Configuration* Configuration::_instance = 0;

    Configuration& Configuration::instance() {
        if (!_instance) {
            _instance = new Configuration;
            atexit(destroy);
        }
        return *_instance;
    }
    
    void Configuration::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    int Configuration::getScreenWidth() {
        return 1024;
    }
    
    int Configuration::getScreenHeight() {
        return 768;
    }

}
