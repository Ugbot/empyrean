/**
 * This file contains primitive sized types.
 */
#ifndef PYR_TYPES_H
#define PYR_TYPES_H


#include <prtypes.h>


namespace pyr {

    // in case we decouple from SDL

    typedef PRUint8  u8;
    typedef PRUint16 u16;
    typedef PRUint32 u32;
    typedef PRUint64 u64;

    typedef PRInt8  s8;
    typedef PRInt16 s16;
    typedef PRInt32 s32;
    typedef PRInt64 s64;

    struct Rect {
        int left;
        int top;
        int right;
        int bottom;
    
        inline int Width()  const { return right-left; }
        inline int Height() const { return bottom-top; }
    
        Rect(int x1, int y1, int x2, int y2) : left(x1), right(x2), top(y1), bottom(y2) {}
        Rect() : left(0), right(0), top(0), bottom(0) {}
    };

    struct RGBA {
        u8 r, g, b, a;

        RGBA()
            : r(0), g(0), b(0), a(0)		{}

        RGBA(u8 ar, u8 ag, u8 ab, u8 aa = 255)
            : r(ar), g(ag), b(ab), a(aa) 	{}

        // convert from 16bpp
        RGBA(u16 c) {
            b = (c & 31) << 3;
            g = (c >> 3) & 0xFC;
            r = (c >> 8) & 0xF8;
            a = c ? 0xFF : 0;
        }

        // conversion from 8bpp with palette
        RGBA(u8 c, u8* pPal) {
            r = pPal[c * 3    ] << 2;
            g = pPal[c * 3 + 1] << 2;
            b = pPal[c * 3 + 2] << 2;
            a = c ? 0xFF : 0;
        }

        RGBA(u32 c) {
            // not endian independant
            a = c >> 24;
            r = (c >> 16) & 0xFF;
            g = (c >> 8) & 0xFF;
            b = c & 0xFF;
        }

        inline operator u32() const {
            return *(u32*)this; // bwa
        }
    };

}

#endif
