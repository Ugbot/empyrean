#include "Canvas.h"
#include "MultiTextureImage.h"
#include "OpenGL.h"

namespace {

    // returns num if it's an even power of two
    int nextSmallerPowerOf2(int num) {
        if ( ((num - 1) & num) == 0)
            return num;

        for (int i = sizeof(int) * 8 - 1; i >= 0; i--)
            if (num & (1 << i))
                return num & (1 << i);

        return 0; // @_x
    }

    std::vector<int>& getSizes(int maxtexsize, int imagesize, std::vector<int>& vec) {
        int x = 0;

        while (x < imagesize) {
            int s = nextSmallerPowerOf2(imagesize - x);
            if (s > maxtexsize)
                s = maxtexsize;

            vec.push_back(s);
            x += s;
        }

        return vec;
    }
}

namespace pyr {
    MultiTextureImage::MultiTextureImage(const std::string& s) {
        int maxtexsize;
        glGetIntegerv(GL_MAX_TEXTURE_SIZE, &maxtexsize);

        Canvas src(s);

        getSizes(maxtexsize, src.getWidth(), _hsizes);
        getSizes(maxtexsize, src.getHeight(), _vsizes);

        _texcols = _hsizes.size();
        _texrows = _vsizes.size();
        _tex.reserve(_texcols * _texrows);

        int x = 0;
        int y = 0;
        for (int row = 0; row < _texrows; row++) {
            for (int col = 0; col < _texcols; col++) {
                Canvas c(_hsizes[col], _vsizes[row]);
                CanvasBlitter<Opaque>::Blit(src, c, x, y);
                _tex.push_back(new Texture(c.getWidth(), c.getHeight(), (u32*)c.getPixels()));
                x -= _hsizes[col];
            }

            x = 0;
            y -= _vsizes[row];
        }
    }

    MultiTextureImage::~MultiTextureImage() {
        for (uint i=0; i < _tex.size(); i++)
            delete _tex[i];
    }

    void MultiTextureImage::draw(float x, float y, float width, float height) {
        float xscale = width / _width;
        float yscale = height / _height;
        float curx = x;
        float cury = y;
        int idx = 0;

        for (int row = 0; row < _texrows; row ++) {
            float ys = _vsizes[row] * yscale;

            for (int col = 0; col < _texcols; col++) {
                _tex[idx]->drawRectangle(curx, cury, _hsizes[col] * xscale, ys);
                curx += (float)_hsizes[col];
                idx++;
            }

            curx = x;
            cury += ys;
        }
    }

    int MultiTextureImage::width() {
        return _width;
    }

    int MultiTextureImage::height() {
        return _height;
    }
}
