#ifndef PYR_CANVAS_H
#define PYR_CANVAS_H

#include <string>
#include "Types.h"

namespace pyr {
    struct Rect {
        int left;
        int top;
        int right;
        int bottom;

        inline int Width()  const { return right-left; }
        inline int Height() const { return bottom-top; }
    
        Rect(int x1, int y1, int x2, int y2) : left(x1), top(y1), right(x2), bottom(y2) {}
        Rect() : left(0), top(0), right(0), bottom(0) {}
    };

    struct RGBA {
        u8 r, g, b, a;

        RGBA()
            : r(0), g(0), b(0), a(0)		{}

        RGBA(u8 ar, u8 ag, u8 ab, u8 aa = 255)
            : r(ar), g(ag), b(ab), a(aa) 	{}

        // convert from 16bpp
        RGBA(u16 c) {
            b = u8((c & 31) << 3);
            g = u8((c >> 3) & 0xFC);
            r = u8((c >> 8) & 0xF8);
            a = c ? 0xFF : 0;
        }

        // conversion from 8bpp with palette
        RGBA(u8 c, u8* pPal) {
            r = pPal[c * 3    ] << 2;
            g = pPal[c * 3 + 1] << 2;
            b = pPal[c * 3 + 2] << 2;
            a = c ? 0xFF : 0;
        }
    };

    /**
    * Canvases are purely software representations of images.  Nothing more.
    * Any time one is manipulating graphics for more than just user-feedback
    * (editing image files, and such) these are used.
    *
    * Inherit from this class and I will hunt you down and chop your nuts off.
    */
    class Canvas {
    private:
        RGBA* _pixels;                                              ///< Pointer to raw pixel data
        int _width, _height;                                        ///< Dimensions
        
        Rect _cliprect;                                             ///< Operations are restricted to this region of the image.
        
    public:
        // con/destructors
        Canvas();
        Canvas(int width,int height);
        Canvas(u8* pData,int nWidth,int nHeight,u8* pal);
        Canvas(RGBA* pData,int nWidth,int nHeight);
        Canvas(const std::string& fname);
        Canvas(const Canvas& src);
        ~Canvas();

        void save(const std::string& fname);
        
        // The basics
        void copyPixelData(u8* data,int width,int height,u8* pal);  ///< Copies raw, palettized pixel data into the image
        void copyPixelData(RGBA* data,int width,int height);        ///< Copies raw RGBA pixel data into the image
        Canvas& operator = (const Canvas& rhs);         ///< Copies one image into another.
        bool operator == (const Canvas& rhs);                 ///< Returns true if the images have the same dimensions, and contain the same data. (SLOW!)
        
        // Accessors
        inline const int& getWidth()   const { return _width;  }
        inline const int& getHeight()  const { return _height; }
        inline RGBA* getPixels() const { return _pixels; }
        RGBA getPixel(int x,int y);
        void setPixel(int x,int y,RGBA c);

        // Misc junk
        void clear(RGBA colour);
        void rotate();
        void flip();
        void mirror();
        void resize(int x,int y);
        
        const Rect& getClipRect() { return _cliprect; }
        void setClipRect(const Rect& r);
    };

}

#include "CanvasBlitter.h"

#endif
