#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include <string>
#include "Error.h"
#include "Singleton.h"
#include "Types.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(ConfigurationError);

    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)

        Configuration();
        ~Configuration() { }
        
    public:
        void load();
        void save() const;
    
        int screenWidth;
        int screenHeight;
        bool fullscreen;

        bool enableMusic;
        
        std::string server;
        std::string username;
    };

}


#endif
