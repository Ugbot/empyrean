#ifndef PIXEL_MATRIX_H
#define PIXEL_MATRIX_H

#include <string>
#include "types.h"

namespace pyr {
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
