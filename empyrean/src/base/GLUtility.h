#ifndef PYR_GL_UTILITY_H
#define PYR_GL_UTILITY_H


#include "OpenGL.h"
#include "VecMath.h"


namespace pyr {

    void setOrthoProjection(float width, float height, bool cartesian = false);
        
    inline void glTranslate(const Vec2f& vec) {
        glTranslatef(vec[0], vec[1], 0);
    }
    
    inline void glVertex(const Vec2f& vec) {
        glVertex2f(vec[0], vec[1]);
    }
    
    inline void glTexCoord(const Vec2f& vec) {
        glTexCoord2f(vec[0], vec[1]);
    }

    inline void glColor(const Vec4f& vec) {
        glColor4f(vec[0], vec[1], vec[2], vec[3]);
    }

}


#endif
