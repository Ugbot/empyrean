#ifndef PYR_TEXTURE_H
#define PYR_TEXTURE_H

#include <string>
#include "extgl.h"
#include "Types.h"

namespace pyr {
    enum PixelFormat {
        PF_GRAYSCALE = 1,
        PF_RGB       = 3,
        PF_ARGB      = 4
    };

    class Texture {
    public:
        static Texture* create(const std::string& id);

        Texture(const std::string& filename);
        Texture(int width,int height,u32* pixeldata);
        ~Texture();
        
        void bind();
        static void unbind();
        void drawRectangle(float x1, float y1, float width, float height);
        void drawRectangle(float x, float y);

        int width() const;
        int height() const;
        int texWidth() const;
        int texHeight() const;

    private:
        GLuint _texture;
        float _realWidth;
        float _realHeight;
        int _width;
        int _height;
        int _texWidth;
        int _texHeight;

        void createTexture(int width,int height,u32* pixeldata);
    };
}

#endif
