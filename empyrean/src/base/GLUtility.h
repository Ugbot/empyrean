#ifndef PYR_GL_UTILITY_H
#define PYR_GL_UTILITY_H


#include <gmtl/Vec.h>
#include "OpenGL.h"


namespace pyr {

    inline void glTranslate(const gmtl::Vec2f& vec) {
        glTranslatef(vec[0], vec[1], 0);
    }

    inline void glVertex(const gmtl::Vec2f& vec) {
        glVertex2f(vec[0], vec[1]);
    }

    inline void glTexCoord(const gmtl::Vec2f& vec) {
        glTexCoord2f(vec[0], vec[1]);
    }

    inline void glColor(const gmtl::Vec4f& vec) {
        glColor4f(vec[0], vec[1], vec[2], vec[3]);
    }

}


#endif
