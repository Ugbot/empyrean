
#include "Texture.h"
#include "OpenGL.h"
#include <corona.h>

namespace pyr {

    Texture::Texture(unsigned handle, int width, int height)
        : _handle(handle)
        , _width(width)
        , _height(height)
    {}

    Texture::~Texture() {
        glDeleteTextures(1, &_handle);
    }

    PYR_DEFINE_SINGLETON(TexManager)
    Texture* TexManager::loadTex(const std::string& fileName) {
        if (_textures.count(fileName)) {
            return _textures[fileName];
        } else {
            corona::Image* img = corona::OpenImage(fileName.c_str(), corona::FF_AUTODETECT, corona::PF_R8G8B8A8);
            if (!img)
                return _dummyTex;

            // TODO: power of 2. (it rhymes!)

            unsigned handle;
            int width = img->getWidth();
            int height = img->getHeight();

            glGenTextures(1, &handle);
            glBindTexture(GL_TEXTURE_2D, handle);
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, img->getPixels());
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

            Texture* tex = new Texture(handle, width, height);
            _textures[fileName] = tex;

            delete img;
            return tex;
        }
    }

    void TexManager::clear() {
            for (TexMap::iterator iter = _textures.begin(); iter != _textures.end(); iter++) {
                delete iter->second;
            }
            _textures.clear();
    }

    TexManager::TexManager()
        : _dummyTex(new Texture(0, 0, 0))
    {}

    TexManager::~TexManager() {
        // In mega happy happy land, this will never do anything, because the other
        // parts of the editor will clean their textures up on their own.
        clear();
    }

}