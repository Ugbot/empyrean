#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


#include <string>


namespace pyr {

    class Configuration {
    public:
        static Configuration& instance();
        
    private:
        static void destroy();
        Configuration()  { }
        ~Configuration() { }
        
    public:
        // immutable for now
        int getScreenWidth();
        int getScreenHeight();
        
        std::string getServer();
        int getPort();
        
    private:
        static Configuration* _instance;
    };

}


#endif
