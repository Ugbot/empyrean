#include <algorithm>
#include <cassert>
#include "corona.h"
#include "Canvas.h"

using std::swap;
template <class T>
T& max(T a, T b) {
    return a > b ? a : b;
}

template <class T>
T& min(T a, T b) {
    return a < b ? a : b;
}

namespace pyr {

    Canvas::Canvas() {
        _width = _height = 16;		// arbitrary
        _pixels = new RGBA[_width * _height];
        _cliprect = Rect(0, 0, _width, _height);
    }

    Canvas::Canvas(int w, int h) {
        _width = w;
        _height = h;
        
        _pixels = new RGBA[_width * _height];
        _cliprect = Rect(0, 0, _width, _height);
    }

    Canvas::Canvas(RGBA* pSrc, int w, int h) {
        _width = w;
        _height = h;
        _pixels = new RGBA[_width * _height];
        std::copy(pSrc, pSrc + _width * _height, _pixels);
        _cliprect = Rect(0, 0, _width, _height);
    }

    Canvas::Canvas(u8* data, int w, int h, u8* pal) {
        _width = w;
        _height = h;
        _pixels = new RGBA[_width * _height];
        for (int i = 0; i < _width * _height; i++)
            _pixels[i] = RGBA(data[i], pal);
        _cliprect = Rect(0, 0, _width, _height);
    }

    Canvas::Canvas(const std::string& filename) {
        corona::Image* img = corona::OpenImage(filename.c_str(), corona::FF_AUTODETECT, corona::PF_R8G8B8A8);
        if (!img) {
            throw std::runtime_error(std::string("pyr::Canvas: Can't load ") + filename);
        }

        _width = img->getWidth();
        _height = img->getHeight();
        _pixels = new RGBA[_width * _height];
        std::copy((RGBA*)img->getPixels(), ((RGBA*)img->getPixels()) + _width * _height, _pixels);

        _cliprect = Rect(0, 0, _width, _height);

        delete img;
    }

    Canvas::Canvas(const Canvas& src) {
        _width = src._width;
        _height = src._height;
        _pixels = new RGBA[_width * _height];
        memcpy(_pixels, src._pixels, _width * _height * sizeof(RGBA));
        _cliprect = Rect(0, 0, _width, _height);
    }

    Canvas::~Canvas() {
        delete[] _pixels;
    }

    void Canvas::save(const std::string& fname) {
        corona::Image* img = corona::CreateImage(_width, _height, corona::PF_R8G8B8A8);
        assert(img);

        RGBA* pDest = (RGBA*)img->getPixels();
        std::copy(_pixels, _pixels + _width * _height, pDest);

        corona::SaveImage(fname.c_str(), corona::FF_PNG, img);
        delete img;
    }

    Canvas& Canvas::operator = (const Canvas& rhs) {
        if (this == &rhs)
            return *this;
        
        delete[] _pixels;
        
        _width = rhs._width;
        _height = rhs._height;
        _pixels = new RGBA[_width * _height];
        memcpy(_pixels, rhs._pixels, _width * _height * sizeof(RGBA));
        
        return *this;
    }

    bool Canvas::operator == (const Canvas& rhs) {
        if (_width != rhs._width)
            return false;
        if (_height != rhs._height)
            return false;
        
        return !memcmp(_pixels, rhs._pixels, _width * _height * sizeof(RGBA));
    }

    void Canvas::copyPixelData(RGBA* data, int _width, int _height) {
        delete[] _pixels;
        
        _width = _width;
        _height = _height;
        
        _pixels = new RGBA[_width * _height];
        memcpy(_pixels, data, _width * _height * sizeof(RGBA));

        _cliprect = Rect(0, 0, _width, _height);
    }

    void Canvas::copyPixelData(u8* data, int _width, int _height, u8* pal) {
        delete[] _pixels;
        
        _width = _width;
        _height = _height;
        
        _pixels = new RGBA[_width * _height];
        for (int i = 0; i < _width * _height; i++)
            _pixels[i] = RGBA(data[i], pal);
    }

    RGBA Canvas::getPixel(int x, int y) {
        if (x < 0 || x >= _width)
            return RGBA(0, 0, 0, 0);
        if (y < 0 || y >= _height)
            return RGBA(0, 0, 0, 0);
        
        return _pixels[y * _width + x];
    }

    void Canvas::setPixel(int x, int y, RGBA c) {
        if (x < 0 || x >= _width)
            return;
        if (y < 0 || y >= _height)
            return;
        
        _pixels[y * _width+x]=c;
    }

    void Canvas::clear(RGBA colour) {
        // I feel like being nasty right now >:D
        RGBA* p = _pixels + _width * _height - 1;
        
        while (p >= _pixels)
            *p-- = colour;
    }

    void Canvas::rotate() {
        Canvas temp(*this);
        
        for (int y = 0; y < _height; y++)
            for (int x = 0; x < _width; x++)
                setPixel(y, x, temp.getPixel(x, y));
    }

    void Canvas::flip() {
        Canvas temp(*this);
        
        for (int y = 0; y < _height; y++)
            for (int x = 0; x < _width; x++)
                setPixel(x, y, temp.getPixel(x, _height - y - 1));
    }

    void Canvas::mirror() {
        Canvas temp(*this);
        
        for (int y = 0; y < _height; y++)
            for (int x = 0; x < _width; x++)
                setPixel(x, y, temp.getPixel(_width - x - 1, y));
    }

    void Canvas::resize(int x, int y) {
        if (x < 1 || y < 1)
            return;
        
        RGBA* pTemp = new RGBA[x * y];
        
        RGBA* pSrc = _pixels;
        RGBA* pDest = pTemp;
        
        int ylen = _height < y?_height:y;
        int nCopy_width=sizeof(RGBA) * (_width < x ? _width : x);							// smaller of the two
        while (ylen--) {
            memcpy(pDest, pSrc, nCopy_width);
            pDest += x;
            pSrc += _width;
        }
        
        delete[] _pixels;
        _pixels = pTemp;
        _width = x;
        _height = y;

        setClipRect(Rect(0, 0, _width, _height));
    }

    void Canvas::setClipRect(Rect& r) {
        _cliprect.left=max(0, r.left);
        _cliprect.top=max(0, r.top);
        _cliprect.right=min(_width, r.right);
        _cliprect.bottom=min(_height, r.bottom);

        if (r.Width() < 0)    swap(r.left, r.right);
        if (r.Height() < 0)   swap(r.top, r.bottom);
    }

}