#include "GLUtility.h"

namespace pyr {

    static const float NEG_PLANE = -2000;
    static const float POS_PLANE  = 2000;

    void setOrthoProjection(float width, float height, bool cartesian) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        if (cartesian) {
            glOrtho(0, width, 0, height, NEG_PLANE, POS_PLANE);
        } else {
            glOrtho(0, width, height, 0, NEG_PLANE, POS_PLANE);
        }
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
    }

    const char* getErrorString(GLenum error) {
        switch (error) {
            case GL_INVALID_ENUM:      return "GL_INVALID_ENUM";
            case GL_INVALID_VALUE:     return "GL_INVALID_VALUE";
            case GL_INVALID_OPERATION: return "GL_INVALID_OPERATION";
            case GL_STACK_OVERFLOW:    return "GL_STACK_OVERFLOW";
            case GL_STACK_UNDERFLOW:   return "GL_STACK_UNDERFLOW";
            case GL_OUT_OF_MEMORY:     return "GL_OUT_OF_MEMORY";
            case GL_TABLE_TOO_LARGE:   return "GL_TABLE_TOO_LARGE";
            default:                   return "Unknown error";
        }
    }

}
