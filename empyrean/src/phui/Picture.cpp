#include "Picture.h"


namespace phui {

    Picture::Picture(const std::string& filename) {
        _texture = pyr::Texture::create(filename);
    }
    
    void Picture::draw() const {
        glEnable(GL_TEXTURE_2D);
        glColor3f(1, 1, 1);
        _texture->drawRectangle(0, 0, float(getWidth()), float(getHeight()));
    }

}
