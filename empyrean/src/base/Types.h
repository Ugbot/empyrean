#ifndef PYR_TYPES_H
#define PYR_TYPES_H


#include <SDL.h>


namespace pyr {

    // in case we decouple from SDL

    typedef Uint8  u8;
    typedef Uint16 u16;
    typedef Uint32 u32;
    typedef Uint64 u64;
    
    typedef Sint8  s8;
    typedef Sint16 s16;
    typedef Sint32 s32;
    typedef Sint64 s64;

    union Color {
        struct {
            float r,g,b,a;
        };

        float c[4];

        Color() : r(0),g(0),b(0),a(0) {}
        Color(float R,float G,float B,float A)
            : r(R),g(G),b(B),a(A) {}
    };
}


#endif
