
#include <cassert>
#include "TextureImage.h"

namespace pyr {
    TextureImage::TextureImage(const std::string& fname) 
        : _tex(Texture::create(fname))
    {
        assert(_tex);
    }

    TextureImage::~TextureImage() {
        // delete _tex; ?
    }

    void TextureImage::draw(float x, float y, float width, float height) {
        _tex->drawRectangle(x, y, width, height);
    }

    int TextureImage::width() {
        return _tex->width();
    }

    int TextureImage::height() {
        return _tex->height();
    }
}