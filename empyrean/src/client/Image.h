#ifndef PYR_IMAGE_H
#define PYR_IMAGE_H

namespace pyr {
    /**
     * Abstract image interface.
     *
     * Represents a matrix of pixels, stored in some hardware-friendly format.
     */
    /* interface */ class Image {
    public:
        virtual ~Image(){}

        virtual void draw(float x, float y, float width, float height) = 0;
        virtual void draw(float x, float y) {   // still virtual so it can be overridden where convenient
            draw(x, y, (float)width(), (float)height());
        }

        virtual int width() = 0;
        virtual int height() = 0;
    };
}

#endif
