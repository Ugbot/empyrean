#include <SDL_opengl.h>
#include "Map.h"


namespace pyr {

    void Map::draw() {
        glBegin(GL_QUADS);
        for (unsigned i = 0; i < _rectangles.size(); ++i) {
            Rectangle& r = _rectangles[i];
            glVertex2f(r.x1, r.y1);
            glVertex2f(r.x1, r.y2);
            glVertex2f(r.x2, r.y2);
            glVertex2f(r.x2, r.y1);
        }
        glEnd();
    }
    
    
    void Map::addRectangle(float x1, float y1, float x2, float y2) {
        Rectangle r = { x1, y1, x2, y2 };
        _rectangles.push_back(r);
        
    }

}
