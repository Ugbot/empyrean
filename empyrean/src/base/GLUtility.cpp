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

}
