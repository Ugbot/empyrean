#ifndef PYR_TEXTURE_H
#define PYR_TEXTURE_H

#include <string>
#include <SDL_opengl.h>

namespace pyr {
    class Texture {
    public:
        static Texture* create(const std::string& id);

        Texture(const std::string& filename);
        ~Texture();
        
        void bind();
        static void unbind();
        void drawRectangle(float x1, float y1, float x2, float y2);

    private:
        GLuint _texture;
        float _realWidth;
        float _realHeight;
    };
}

#endif
