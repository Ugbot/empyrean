#include "GLUtility.h"

namespace pyr {

    void setOrthoProjection(float width, float height, bool cartesian) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        if (cartesian) {
            glOrtho(0, width, 0, height, -1, 1);
        } else {
            glOrtho(0, width, height, 0, -1, 1);
        }
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
    }

}
