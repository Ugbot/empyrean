#include <iostream>
#include <memory>
#include <stdexcept>
#include <corona.h>
#include "ResourceManager.h"
#include "Texture.h"
#include "Types.h"
#include "Utility.h"
using namespace corona;


namespace pyr {

    template<>
    class CachePolicy<Texture*> {
    public:
        static Texture* create(const std::string& id) {
            return new Texture(id);
        }
        
        static void destroy(Texture* texture) {
            delete texture;
        }

        static Texture* copy(Texture* texture) {
            return texture;
        }
    };


    int getNextPowerOf2(int n) {
        int i = 1;
        while (i < n) {
            i *= 2;
        }
        return i;
    }


    inline void throwTextureError(const std::string& error) {
        throw std::runtime_error(error.c_str());
    }
    
    
    Texture* Texture::create(const std::string& id) {
        return ResourceManager::instance().get<Texture*>(id);
    }


    Texture::Texture(const std::string& filename) {
        ScopedPtr<Image> image(
            OpenImage(filename.c_str(), FF_AUTODETECT, PF_R8G8B8A8));
        if (!image) {
            throwTextureError("Could not load image '" + filename + "'");
        }

        createTexture(image->getWidth(), image->getHeight(), (u32*)image->getPixels());
    }

    Texture::Texture(int width,int height,u32* pixeldata) {
        createTexture(width, height, pixeldata);
    }

    Texture::~Texture() {
        glDeleteTextures(1, &_texture);
    }    

    void Texture::bind() {
        glBindTexture(GL_TEXTURE_2D, _texture);
    }


    void Texture::unbind() {
        glBindTexture(GL_TEXTURE_2D, 0);
    }


    void Texture::drawRectangle(float x1, float y1, float width, float height) {
        float x2 = x1 + width;
        float y2 = y1 + height;
        bind();
        glBegin(GL_QUADS);
        glTexCoord2f(0,          0);           glVertex2f(x1, y1);
        glTexCoord2f(_realWidth, 0);           glVertex2f(x2, y1); 
        glTexCoord2f(_realWidth, _realHeight); glVertex2f(x2, y2); 
        glTexCoord2f(0,          _realHeight); glVertex2f(x1, y2); 
        glEnd();
    }

    void Texture::drawRectangle(float x, float y) {
        drawRectangle(x, y, x + _width, y + _height);
    }

    int Texture::width() const {
        return _width;
    }

    int Texture::height() const {
        return _height;
    }

    void Texture::createTexture(int width,int height,u32* pixeldata) {
        _width = width;
        _height = height;

        // remember the actual size of the image so we know how much of the
        // texture to use when calculating texture coordinates
        int  real_width  = width;
        int  real_height = height;
        u32* real_pixels = pixeldata;

        // allocate power of two buffer to store actual texture memory
        // and zero it
        int tex_width  = getNextPowerOf2(real_width);
        int tex_height = getNextPowerOf2(real_height);
        ScopedArray<u32> buffer(new u32[tex_width * tex_height]);
        memset(buffer.get(), 0, tex_width * tex_height * sizeof(u32));

        /// @todo  make sure we don't try to create a texture that
        ///        larger than what the video card can handle...
        ///        3Dfx cards can only handle 256*256 tex's

        // copy our image pixels into the texture buffer
        for (int row = 0; row < real_height; ++row) {
            memcpy(buffer.get() + tex_width * row,
                   real_pixels + real_width * row,
                   real_width * sizeof(u32));
        }

        _realWidth  = float(real_width)  / tex_width;
        _realHeight = float(real_height) / tex_height;

        glGenTextures(1, &_texture);
        glBindTexture(GL_TEXTURE_2D, _texture);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8,
                     tex_width, tex_height,
                     0, GL_RGBA, GL_UNSIGNED_BYTE, buffer.get());

        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    }
}
