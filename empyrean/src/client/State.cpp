#include "OpenGL.h"
#include "State.h"


namespace pyr {

    void State::setOrthoProjection(float width, float height) {
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, width, height, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
    }

}
