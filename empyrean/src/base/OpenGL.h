#ifndef PYR_OPEN_GL_H
#define PYR_OPEN_GL_H


#if defined(WIN32) || defined(_WIN32)
    #include <windows.h>
    #ifndef PYR_USE_EXTGL
        #define PYR_USE_EXTGL
    #endif
#endif

#ifdef PYR_USE_EXTGL
    #include "extgl.h"
    #include <GL/glu.h>
#else
    #include <GL/gl.h>
    #include <GL/glu.h>
#endif


#endif
