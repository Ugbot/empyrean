#ifndef PYR_ERROR_H
#define PYR_ERROR_H


#include <stdexcept>
#include <string>


/**
 * PYR_EXCEPTION_TRAP defines a block of code that catches all
 * exceptions and converts them into fatal errors.  An exception
 * trap is usually placed around callbacks or entry points, such
 * as wxWindows event handlers or main().
 */
#define PYR_EXCEPTION_TRAP(block) {                 \
    try {                                           \
        block                                       \
    }                                               \
    catch (const std::exception& e) {               \
        std::string what = e.what();                \
        pyr::error("Exception: " + what);           \
    }                                               \
    PYR_CATCH_ALL()                                 \
}


#if 0  // In Windows, catch (...) catches far too much.
#define PYR_CATCH_ALL()                             \
    catch (...) {                                   \
        pyr::error("Unknown exception");            \
    }
#else
#define PYR_CATCH_ALL()
#endif


/// Defines an exception class that derives from std::runtime_error.
#define PYR_DEFINE_RUNTIME_ERROR(name)  \
    struct name : std::runtime_error {  \
        name(const std::string& what)   \
        : std::runtime_error(what) { }  \
    }


namespace pyr {

    /// At this point in time, error() DOES return.
    void error(const std::string& message);
    
    /// So warning can just call error...
    inline void warning(const std::string& message) {
        error(message);
    }

}


#endif
