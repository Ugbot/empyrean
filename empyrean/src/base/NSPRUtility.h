#ifndef PYR_NSPR_UTILITY_H
#define PYR_NSPR_UTILITY_H


#include <string>


namespace pyr {

    /// Returns the current time in seconds.
    float getNow();
    
    /// Throws an exception with an NSPR error string.
    void throwNSPRError(const std::string& prefix);

}


#endif
