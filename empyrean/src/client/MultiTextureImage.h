#ifndef PYR_MULTITEXTUREIMAGE_H
#define PYR_MULTITEXTUREIMAGE_H

#include <vector>
#include "Utility.h"
#include "Image.h"
#include "Texture.h"

namespace pyr {
    /**
     * An image split across many textures.  Used whenever we need to handle
     * very large images, or images that aren't even powers of two.  It's slower
     * than TextureImage because there's more going on, though.
     *
     * Textures are not allocated through the ResourceManager, as the source image
     * is sliced up on the fly.
     */
    class MultiTextureImage : public Image {
    public:
        MultiTextureImage(const std::string& s);
        ~MultiTextureImage();

        static MultiTextureImage* create(const std::string& s) {
            return new MultiTextureImage(s);
        }

        virtual void draw(float x, float y, float width, float height);
        virtual void draw(float x, float y) {   // bleh
            draw(x, y, (float)width(), (float)height());
        }

        virtual int width();
        virtual int height();

    private:
        int _width, _height;        ///< size of the image as a whole
        int _texrows;
        int _texcols;
        std::vector<int> _hsizes;   ///< widths of the textures
        std::vector<int> _vsizes;   ///< http://ikagames.com/andy/gfx/captobvious.gif
        std::vector<Texture*> _tex; ///< The actual textures.  I was considering using a Texture***. (2D array of Texture*s)  :D
    };
}

#endif
