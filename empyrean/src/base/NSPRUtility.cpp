#include <stdexcept>
#include <prerror.h>
#include <prinrval.h>
#include "NSPRUtility.h"
#include "Utility.h"


namespace pyr {

    float getNow() {
        PRIntervalTime now = PR_IntervalNow();
        return PR_IntervalToMicroseconds(now) / 1000000.0f;
    }
    
    void throwNSPRError(const std::string& prefix) {
        int length = PR_GetErrorTextLength();
        ScopedArray<char> error_string(new char[length + 1]);
        PR_GetErrorText(error_string.get());
        error_string[length] = 0;

        throw std::runtime_error(prefix + ": " + error_string.get());
    }

}
