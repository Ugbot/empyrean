/**
 * This file contains primitive sized types.
 */
#ifndef PYR_TYPES_H
#define PYR_TYPES_H


#include "IncludeNSPR.h"


namespace pyr {

    typedef PRUint8  u8;
    typedef PRUint16 u16;
    typedef PRUint32 u32;
    typedef PRUint64 u64;

    typedef PRInt8  s8;
    typedef PRInt16 s16;
    typedef PRInt32 s32;
    typedef PRInt64 s64;


    /**
     * Without these, logging a u8 outputs a char.  You can instead log
     * promoteForOutput(t);
     */

    template<typename T>
    inline T& promoteForOutput(T& t) {
        return t;
    }

    inline u16 promoteForOutput(u8 t) {
        return t;
    }

    inline s16 promoteForOutput(s8 t) {
        return t;
    }

}

#endif
