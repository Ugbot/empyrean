#ifndef PYR_ERROR_H
#define PYR_ERROR_H


#include <stdexcept>
#include <string>


// PYR_BEGIN_EXCEPTION_TRAP and PYR_END_EXCEPTION_TRAP define a
// region of code that catches all exceptions and converts them
// into fatal errors.  An exception trap is usually placed around
// callbacks or entry points, such as wxWindows event handlers or
// main().

#define PYR_BEGIN_EXCEPTION_TRAP()                  \
    try {
    
#define PYR_END_EXCEPTION_TRAP()                    \
    }                                               \
    catch (const std::exception& e) {               \
        std::string what = e.what();                \
        pyr::error("Caught exception: " + what);    \
    }                                               \
    PYR_CATCH_ALL()


/// Defines an exception class that derives from std::runtime_error.
#define PYR_DEFINE_RUNTIME_ERROR(name)  \
    struct name : std::runtime_error {  \
        name(const std::string& what)   \
        : std::runtime_error(what) { }  \
    }


#if 0

/**
 * This is disabled because it can catch system exceptions
 * such as division by zero or null pointer accesses.
 */
#define PYR_CATCH_ALL()                             \
    catch (...) {                                   \
        pyr::error("Caught unknown exception");     \
    }
    
#else
#define PYR_CATCH_ALL()
#endif



namespace pyr {

    /// At this point in time, error() DOES return.
    void error(const std::string& message);
    
    /// So warning can just call error...
    inline void warning(const std::string& message) {
        error(message);
    }

}


#endif
