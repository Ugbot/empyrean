#ifndef PYR_MULTIIMAGETEX_H
#define PYR_MULTIIMAGETEX_H

#include "Image.h"

namespace pyr {
    class Texture;

    /**
     * A bunch of images, all stuffed on the same texture.
     * Ask it for a SubImage, and blit that.
     */
    class MultiImageTex {
    public:
        // Copy safe.
        class SubImage : public Image {
            friend MultiImageTex;
        protected:
            SubImage(MultiImageTex* parent, int x, int y, int w, int h);

        public:
            ~SubImage(){}

            virtual void draw(float x, float y, float width, float height);

            virtual int width();
            virtual int height();

        private:
            MultiImageTex* _parent;
            int _width;
            int _height;
            float _texx1;
            float _texy1;
            float _texx2;
            float _texy2;
        };

    public:
        MultiImageTex(const std::string& fname);
        ~MultiImageTex();

        Image* getImage(int x, int y, int width, int height);

        int width();
        int height();

    private:
        int _instances; // number of SubImage instances created by this class
        Texture* _tex;
    };
}

#endif