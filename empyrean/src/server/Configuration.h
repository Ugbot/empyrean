#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include "Error.h"
#include "Singleton.h"
#include "Types.h"
#include "wx.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(ConfigurationError);

    class Configuration {
        PYR_DECLARE_SINGLETON(Configuration)
        
        Configuration();
        ~Configuration() { }
        
    public:
        void load();
        void save() const;
    
        u16 serverPort;
        bool shouldStartServer;
        
        wxPoint windowPosition;
        wxSize windowSize;

        std::string map;
    };

}


#endif
