#ifndef PYR_NSPR_UTILITY_H
#define PYR_NSPR_UTILITY_H


#include <string>
#include <prinrval.h>


namespace pyr {

    /// Returns the current time in seconds.
    float getNow();
    
    /// If timeout is negative, returns PR_INTERVAL_NO_TIMEOUT.
    PRIntervalTime secondsToInterval(float seconds);
    
    /// Throws an exception with an NSPR error string.
    void throwNSPRError(const std::string& prefix);

}


#endif
