#include <stdexcept>
#include <prerror.h>
#include "NSPRUtility.h"
#include "Utility.h"


namespace pyr {

    float getNow() {
        PRIntervalTime now = PR_IntervalNow();
        return PR_IntervalToMicroseconds(now) / 1000000.0f;
    }
    
    PRIntervalTime secondsToInterval(float seconds) {
        if (seconds < 0) {
            return PR_INTERVAL_NO_TIMEOUT;
        } else {
            return PR_MicrosecondsToInterval(PRUint32(seconds * 1000000));
        }
    }
    
    void throwNSPRError(const std::string& prefix) {
        int length = PR_GetErrorTextLength();
        ScopedArray<char> error_string(new char[length + 1]);
        PR_GetErrorText(error_string.get());
        error_string[length] = 0;

        throw std::runtime_error(prefix + ": " + error_string.get());
    }

}
