#ifndef PYR_SINGLETON_H
#define PYR_SINGLETON_H


#include "Debug.h"
#include "Utility.h"


namespace pyr {

    /**
     * Declares a class 'Class' to be a singleton.  Should be placed
     * in the header file.  Note that the default constructor
     * and destructor still need to be defined as private.  (This
     * leaves the responsibility of defining them up to the client
     * code in case custom behavior is desired.)
     */
    #define PYR_DECLARE_SINGLETON(Class)        \
        public:                                 \
            static Class& instance();           \
        private:                                \
            Class(const Class& n);              \
            void operator=(const Class& n);     \
            static void deleteInstance();       \
            static Class* volatile _instance;   \
            static volatile bool _deleted;
            
    /**
     * Defines implementation of singleton class.  Should be placed
     * in the source file.
     */
    #define PYR_DEFINE_SINGLETON(Class)                                     \
        Class* volatile Class::_instance = 0;                               \
        volatile bool Class::_deleted = false;                              \
        Class& Class::instance() {                                          \
            PYR_ASSERT(!_deleted, "Used singleton after it was deleted!");  \
            if (!_instance) {                                               \
                _instance = new Class;                                      \
                atexit(deleteInstance);                                     \
            }                                                               \
            return *_instance;                                              \
        }                                                                   \
        void Class::deleteInstance() {                                      \
            delete _instance;                                               \
            _instance = 0;                                                  \
            _deleted = true;                                                \
        }

    /**
     * Nifty function that lets you access a singleton with the following syntax:
     * the<Singleton>().method();
     *
     * delmoi: 'the' is the worst name for a function in the history of the world
     */
    template<typename T>
    T& the() {
        return T::instance();
    }

}

#endif
