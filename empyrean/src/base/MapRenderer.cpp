#include <stdexcept>
#include "OpenGL.h"
#include "GLUtility.h"
#include "MapRenderer.h"
#include "MapElement.h"
#include "Texture.h"

namespace pyr {

    MapRenderer::MapRenderer()
    : _currentScale(1.0f) {
    }

    void MapRenderer::visitGroup(GroupElement* e) {
        Vec2f oldPosition = _currentPosition;
        float oldScale    = _currentScale;
        _currentPosition += e->pos * _currentScale;
        _currentScale    *= e->scale;

        glPushMatrix();
        glTranslate(e->pos);
        glScalef(e->scale, e->scale, e->scale);

        for (size_t i = 0; i < e->children.size(); i++) {
            e->children[i]->handleVisitor(*this);
        }

        glPopMatrix();

        _currentPosition = oldPosition;
        _currentScale    = oldScale;
    }

    Vec2f mult(const Vec2f& a, const Vec2f& b) {
        return Vec2f(a[0] * b[0], a[1] * b[1]);
    }

    inline Vec3f normal(Vec3f v) {
        normalize(v);
        return v;
    }

    void MapRenderer::visitGeometry(GeometryElement* e) {
        Vec2f oldPosition = _currentPosition;
        float oldScale    = _currentScale;
        _currentPosition += e->pos * _currentScale;
        _currentScale    *= e->scale;

        bool draw = true;
        if (_haveViewport && fabs(_currentScale) > 0.001f) {
            Vec2f ll = (_lowerLeft  - _currentPosition) / _currentScale;
            Vec2f ur = (_upperRight - _currentPosition) / _currentScale;
            if (!e->visible(ll, ur)) {
                draw = false;
            }
        }

        if (draw) {
            if (_wireframe) {
                glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
            }

            glPushMatrix();
            glTranslate(e->pos);
            glScalef(e->scale, e->scale, e->scale);

            std::vector<Vec3f>& v = e->vertexArray->positions;
            std::vector<Vec3f>& n = e->vertexArray->normals;
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
                    for (size_t j = 0; j < 3; ++j) {
                        glTexCoord(mult(tc[tris[i].tc[j]], mtl->texture_scale) + mtl->texture_offset);
                        glNormal(n[tris[i].n[j]]);
                        glVertex(v[tris[i].pos[j]]);
                    }
                }
                glEnd();
                glDisable(GL_TEXTURE_2D);
            } else {
                glColor(mtl->diffuse);
                glDisable(GL_TEXTURE_2D);
                glBegin(GL_TRIANGLES);
                for (size_t i = 0; i < tris.size(); ++i) {
                    for (size_t j = 0; j < 3; ++j) {
                        glNormal(n[tris[i].n[j]]);
                        glVertex(v[tris[i].pos[j]]);
                    }
                }
                glEnd();
            }

            if (_normals) {
                glBegin(GL_LINES);
                for (size_t i = 0; i < tris.size(); ++i) {
                    for (size_t j = 0; j < 3; ++j) {
                        glVertex(v[tris[i].pos[j]]);
                        glVertex(v[tris[i].pos[j]] + normal(n[tris[i].n[j]]) * 100);
                    }
                }
                glEnd();
            }

            glPopMatrix();
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        }

        _currentPosition = oldPosition;
        _currentScale    = oldScale;
    }

}
