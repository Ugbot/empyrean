#ifndef PYR_SINGLETON_H
#define PYR_SINGLETON_H


/**
 * Declares a class 'name' to be a singleton.  Should be placed
 * in the header file.  Note that the default constructor
 * and destructor still need to be defined as private.  (This
 * leaves the responsibility of defining them up to the client
 * code in case custom behavior is desired.)
 */
#define PYR_DECLARE_SINGLETON(name)     \
    public:                             \
        static name& instance();        \
    private:                            \
        name(const name& n);            \
        void operator=(const name& n);
        
/**
 * Defines implementation of singleton class.  Should be placed
 * in the source file.
 */
#define PYR_DEFINE_SINGLETON(name)      \
    name& name::instance() {            \
        static name _instance;          \
        return _instance;               \
    }
    


#endif
