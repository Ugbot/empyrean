#include "Debug.h"
#include "Renderer.h"

namespace pyr {

    static bool g_inPass = false;
    static std::vector<Drawable*> g_drawables;

    void beginPass(const Projection& projection) {
        PYR_ASSERT(!g_inPass, "beginPass() called twice in a row.");
        g_inPass = true;

        projection.apply();

        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
    }

    void endPass() {
        for (size_t i = 0; i < g_drawables.size(); ++i) {
            g_drawables[i]->getStateSet().apply();
            glPushMatrix();
            glTranslate(g_drawables[i]->getTransformation().getTranslation());
            g_drawables[i]->draw();
            glPopMatrix();
            delete g_drawables[i];
        }
        g_drawables.clear();

        PYR_ASSERT(g_inPass, "endPass() called without matching beginPass().");
        g_inPass = false;
    }

    void addDrawable(Drawable* drawable) {
        PYR_ASSERT(g_inPass, "addDrawable() called outside of a pass.");
        g_drawables.push_back(drawable);
    }


    class GeometryDrawable : public Drawable {
    public:
        GeometryDrawable(const Transformation& xform, const StateSet& state)
            : Drawable(xform, state)
        {
        }

        void addPosition(const Vec2f& pos) {
            _positions.push_back(pos);
        }

        void addPosition(float x, float y) {
            addPosition(Vec2f(x, y));
        }

        void addTexCoord(const Vec2f& tc) {
            _texCoords.push_back(tc);
        }

        void addTexCoord(float u, float v) {
            addTexCoord(Vec2f(u, v));
        }

        void draw() {
            // Uh, I guess we need a polygon type too.
            glBegin(GL_TRIANGLE_FAN);
            if (_texCoords.empty()) {
                for (size_t i = 0; i < _positions.size(); ++i) {
                    glVertex(_positions[i]);
                }
            } else {
                size_t nverts = std::min(_positions.size(), _texCoords.size());
                for (size_t i = 0; i < nverts; ++i) {
                    glTexCoord(_texCoords[i]);
                    glVertex(_positions[i]);
                }
            }
            glEnd();
        }

    private:
        std::vector<Vec2f> _positions;
        std::vector<Vec2f> _texCoords;
    };


    void drawTexture(const Vec2f& pos, Texture* texture, bool blend) {
        PYR_ASSERT(texture, "Can't draw an unspecified texture.");
        drawTexture(pos, Vec2f(float(texture->width()), float(texture->height())), texture, blend);
    }

    void drawTexture(const Vec2f& pos, const Vec2f& size, Texture* texture, bool blend) {
        PYR_ASSERT(texture, "Can't draw an unspecified texture.");

        StateSet ss;
        ss.setTexture(texture);
        ss.setBlend(blend);

        float w  = size[0];
        float h  = size[1];
        float tw = texture->getRealWidth();
        float th = texture->getRealHeight();

        GeometryDrawable* drawable = new GeometryDrawable(pos, ss);
        drawable->addTexCoord(0,  0);  drawable->addPosition(0, 0);
        drawable->addTexCoord(tw, 0);  drawable->addPosition(w, 0);
        drawable->addTexCoord(tw, th); drawable->addPosition(w, h);
        drawable->addTexCoord(0,  th); drawable->addPosition(0, h);
        addDrawable(drawable);
    }

}
