#include "MapFile.h"
#include "OpenGL.h"


namespace pyr {

    void MapFile::draw() {
        glBegin(GL_QUADS);
        /*for (unsigned i = 0; i < _rectangles.size(); ++i) {
            Rectangle& r = _rectangles[i];
            glVertex2f(r.x1, r.y1);
            glVertex2f(r.x1, r.y2);
            glVertex2f(r.x2, r.y2);
            glVertex2f(r.x2, r.y1);
        }*/
        for (unsigned i = 0; i < _terrain.rects.size(); i++) {
            Rect& img = _terrain.rects[i];
            glVertex2f(img.x, img.y);
            glVertex2f(img.x + img.width, img.y);
            glVertex2f(img.x + img.width, img.y + img.height);
            glVertex2f(img.x, img.y + img.height);
        }
        glEnd();
    }
    
}
