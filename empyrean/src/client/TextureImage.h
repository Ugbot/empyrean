#ifndef PYR_TEXTUREIMAGE_H
#define PYR_TEXTUREIMAGE_H

#include <string>
#include "Image.h"
#include "Texture.h"

namespace pyr {
    /**
     * One texture, one image.  Real easy.  Not much here in the way of complexity.
     * There's no real point in doing the ResourceManager on this, as it falls back on
     * the Texture class, which is already dealt with.  Maybe it should anyway, for the
     * sake of consistency, or something.
     */
    class TextureImage : public Image {
    public:
        TextureImage(const std::string& filename);
        ~TextureImage();

        // provided so that these can be instantiated the same way most other classes are.
        static TextureImage* create(const std::string& filename) {
            return new TextureImage(filename);
        }

        virtual void draw(float x, float y, float width, float height);

        // This makes no goddamn sense to me whatsoever.  Image already defines this exact method.
        // Yet I get errors if it's not here too.  What the hell.
        virtual void draw(float x, float y) {
            draw(x, y, (float)width(), (float)height());
        }

        virtual int width();
        virtual int height();

    private:
        Texture* _tex;
    };
}

#endif