#include "GLUtility.h"

namespace pyr {

    static const float NEAR_PLANE = -2000;
    static const float FAR_PLANE  = 2000;

    void setOrthoProjection(float width, float height, bool cartesian) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        if (cartesian) {
            glOrtho(0, width, 0, height, NEAR_PLANE, FAR_PLANE);
        } else {
            glOrtho(0, width, height, 0, NEAR_PLANE, FAR_PLANE);
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
