
#include <cassert>
#include <string>
#include "MultiImageTex.h"
#include "Texture.h"

namespace pyr {
    MultiImageTex::SubImage::SubImage(MultiImageTex* parent, int x, int y, int w, int h) 
        : _parent(parent)
        , _width(w)
        , _height(h)
        , _texx1((float)x / parent->width())
        , _texy1((float)y / parent->height())
        , _texx2((float)(x + w) / parent->width())
        , _texy2((float)(y + h) / parent->height())
    {
    }

    void MultiImageTex::SubImage::draw(float x, float y, float width, float height) {
        _parent->_tex->bind();
        glBegin(GL_QUADS);
        glTexCoord2f(_texx1, _texy1);   glVertex2f(x, y);
        glTexCoord2f(_texx2, _texy1);   glVertex2f(x + width, y);
        glTexCoord2f(_texx2, _texy2);   glVertex2f(x + width, y + height);
        glTexCoord2f(_texx1, _texy2);   glVertex2f(x, y + height);
        glEnd();
    }

    int MultiImageTex::SubImage::width() {
        return _width;
    }

    int MultiImageTex::SubImage::height() {
        return _height;
    }

    MultiImageTex::MultiImageTex(const std::string& fname)
        : _tex(Texture::create(fname))
    {
        assert(_tex);
    }

    Image* MultiImageTex::getImage(int x, int y, int width, int height) {
        return new SubImage(this, x, y, width, height);
    }

    int MultiImageTex::width() {
        return _tex->width();
    }

    int MultiImageTex::height() {
        return _tex->height();
    }
}
