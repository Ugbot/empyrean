#include <stdexcept>
#include "OpenGL.h"
#include "GLUtility.h"
#include "MapRenderer.h"
#include "MapElement.h"
#include "Texture.h"

namespace pyr {

    void MapRenderer::visitGroup(GroupElement* e) {
        glPushMatrix();
        glTranslate(e->pos);

        for (unsigned i = 0; i < e->children.size(); i++) {
            e->children[i]->handleVisitor(this);
        }

        glPopMatrix();
    }

    void MapRenderer::visitGeometry(GeometryElement* e) {
        Texture* tex;
        
        try {
            tex = Texture::create(e->texture); // I hope this isn't as slow as it looks
            tex->bind();
        } catch (const std::runtime_error&) {
            Texture::unbind();
        }

        glPushMatrix();
        glTranslate(e->pos);

        const GeometryElement::VertList& v = e->vertices;

        glBegin(GL_TRIANGLES);
        for (unsigned i = 0; i < e->tris.size(); i++) {
            const GeometryElement::Triangle& t = e->tris[i];

            for (unsigned j = 0; j < 3; j++) {
                const unsigned idx = t.vert[j];

                glTexCoord(v[idx].tex);
                glColor(v[idx].col);
                glVertex(v[idx].pos);
            }
        }
        glEnd();

        glPopMatrix();
    }

}
