#ifndef PYR_CONFIGURATION_H
#define PYR_CONFIGURATION_H


namespace pyr {

    class Configuration {
    public:
        static Configuration& instance();
        
    private:
        static void destroy();
        Configuration()  { }
        ~Configuration() { }
        
    public:
        int getServerPort();
        bool shouldStartServer();
    
    private:
        static Configuration* _instance;
    };

}


#endif
