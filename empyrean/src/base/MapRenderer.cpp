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

        for (size_t i = 0; i < e->children.size(); i++) {
            e->children[i]->handleVisitor(*this);
        }

        glPopMatrix();
    }
    
    Vec2f mult(const Vec2f& a, const Vec2f& b) {
        return Vec2f(a[0] * b[0], a[1] * b[1]);
    }

    void MapRenderer::visitGeometry(GeometryElement* e) {
        glPushMatrix();
        glTranslate(e->pos);

        std::vector<Vec3f>& v = e->vertexArray->positions;
        std::vector<Vec2f>& tc = e->vertexArray->texCoords;
        std::vector<GeometryElement::Triangle>& tris = e->triangles;
        MaterialPtr mtl = e->material;
        if (!mtl) {
            mtl = new Material;
        }

        Texture* texture = 0;
        if (!mtl->texture.empty()) {
            texture = Texture::create(mtl->texture);
        }

        if (texture) {
            glColor3f(1, 1, 1);
            glEnable(GL_TEXTURE_2D);
            texture->bind();
            glBegin(GL_TRIANGLES);
            for (size_t i = 0; i < tris.size(); ++i) {
                glTexCoord(mult(tc[tris[i].tc[0]], mtl->texture_scale) + mtl->texture_offset); glVertex(v[tris[i].pos[0]]);
                glTexCoord(mult(tc[tris[i].tc[1]], mtl->texture_scale) + mtl->texture_offset); glVertex(v[tris[i].pos[1]]);
                glTexCoord(mult(tc[tris[i].tc[2]], mtl->texture_scale) + mtl->texture_offset); glVertex(v[tris[i].pos[2]]);
            }
            glEnd();
            glDisable(GL_TEXTURE_2D);
        } else {
            glColor(mtl->diffuse);
            glDisable(GL_TEXTURE_2D);
            glBegin(GL_TRIANGLES);
            for (size_t i = 0; i < tris.size(); ++i) {
                glVertex(v[tris[i].pos[0]]);
                glVertex(v[tris[i].pos[1]]);
                glVertex(v[tris[i].pos[2]]);
            }
            glEnd();
        }

        glPopMatrix();
    }

}
