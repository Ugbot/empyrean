/**
 * @file
 * This is named TimeUtility.h instead of Time.h because I was
 * getting conflicts between "Time.h" and <time.h>
 */

#ifndef PYR_TIME_H
#define PYR_TIME_H


#include <prinrval.h>


namespace pyr {

    inline float getNow() {
        PRIntervalTime now = PR_IntervalNow();
        return PR_IntervalToMicroseconds(now) / 1000000.0f;
    }

}


#endif
