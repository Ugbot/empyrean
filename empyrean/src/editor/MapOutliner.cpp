
#include "OpenGL.h"
#include "GLUtility.h"

#include "MapOutliner.h"
#include "MapElement.h"

namespace pyr {

    void MapOutliner::visitGeometry(GeometryElement* e) {
        glBindTexture(GL_TEXTURE_2D, 0);

        // Draw a big red dot at the center of the node
        glColor3f(1, 0, 0);
        glPointSize(9);
        glBegin(GL_POINTS);
        glVertex(e->pos);
        glEnd();

        // Draw segments in blue
        glColor3f(0, 0, 1);
        for (unsigned i = 0; i < e->tris.size(); i++) {
            const GeometryElement::Triangle& t = e->tris[i];

            glBegin(GL_LINE_LOOP);
            for (unsigned j = 0; j < 3; j++) {
                const unsigned idx = t.vert[j];

                glVertex(e->vertices[idx].pos);
            }
            glEnd();
        }

        // Draw points as green dots
        glColor3f(0, 1, 0);
        glPointSize(3);
        glBegin(GL_POINTS);
        for (unsigned i = 0; i < e->vertices.size(); i++) {
            glVertex(e->vertices[i].pos);
        }
        glEnd();
    }

    void MapOutliner::visitGroup(GroupElement* e) {
        for (unsigned i = 0; i < e->children.size(); i++) {
            // maybe not so hot if we start recursing out the wazoo.
            glPushMatrix();
            glTranslate(e->pos);

            e->children[i]->handleVisitor(this);

            glPopMatrix();
        }
    }

}
