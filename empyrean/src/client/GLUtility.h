#ifndef PYR_GL_UTILITY_H
#define PYR_GL_UTILITY_H


#include <gmtl/Vec.h>
#include "extgl.h"


namespace pyr {

    inline void glTranslate(const gmtl::Vec2f& vec) {
        glTranslatef(vec[0], vec[1], 0);
    }

}


#endif
