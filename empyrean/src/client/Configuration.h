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
        // immutable for now
        int getScreenWidth();
        int getScreenHeight();
        
    private:
        static Configuration* _instance;
    };

}


#endif
