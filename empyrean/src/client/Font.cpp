#include <stdexcept>
#include "Font.h"
#include "Texture.h"
#include "Utility.h"

namespace pyr {
    int Font::_refCount = 0;
    FT_Library Font::_library = 0;

    Font::Font(const std::string& face,int size,Style style)
        : _face(0)
        , _pos(0, 0)
        , _scale(1.0f)
    {
        int result;

        if (_refCount == 0) {
            result = FT_Init_FreeType( &_library );
            if (result != 0)
                throw std::runtime_error("Unable to initialize FreeType");
        }

        _refCount++;

        result=FT_New_Face(_library, face.c_str(), 0, &_face );
        if (result != 0)
            throw std::runtime_error(std::string("Unable to load ")+face);

        result=FT_Set_Pixel_Sizes(_face, 0, size);
        if (result != 0)
            throw std::runtime_error(face+": Unable to set font size");
    }

    Font::~Font() {
        _refCount--;
        if (_refCount == 0) {
            FT_Done_FreeType(_library);
            _library=0;
        }

        for (GlyphMap::iterator iter = _glyphs.begin(); iter != _glyphs.end(); iter++) {
            Glyph& glyph = iter->second;
            delete glyph.tex;
        }
    }

    const gmtl::Vec2f& Font::getPos() const {
        return _pos;
    }

    void Font::setPos(const gmtl::Vec2f& pos) {
        _pos=pos;
    }

    float Font::getScale() const {
        return _scale;
    }

    void Font::setScale(float scale) {
        _scale = scale;
        if (_scale < 0.01f)
            scale = 0.01f;
    }
    void Font::printString(const std::string& s) {
        for (unsigned int i = 0; i < s.length(); i++) {
            if (s[i] == '\n')
                _pos[0] = 0;
            else {
                Glyph& glyph = getGlyph(s[i]);

                glyph.tex->drawRectangle(_pos[0] + glyph.bearingX * _scale
                    , _pos[1] - glyph.bearingY * _scale
                    , glyph.tex->width() * _scale
                    , glyph.tex->height() * _scale);
                _pos[0] += glyph.advance * _scale;
            }
        }
    }
    
    Font& Font::operator << (const std::string& s) {
        printString(s);
        return *this;
    }

    Font& Font::operator << (int i) {
        std::stringstream ss;
        ss << i;
        printString(ss.str());
        return *this;
    }

    Font& Font::operator << (float v) {
        std::stringstream ss;
        ss << v;
        printString(ss.str());
        return *this;
    }

    Font::Glyph& Font::getGlyph(char c) {
        if (_glyphs.find(c) != _glyphs.end())
            return _glyphs[c];

        int result = FT_Load_Char(_face, c, FT_LOAD_RENDER);
        FT_Bitmap& bmp = _face->glyph->bitmap;

        Glyph glyph;
        glyph.bearingX = _face->glyph->metrics.horiBearingX / 64;
        glyph.bearingY = _face->glyph->metrics.horiBearingY / 64;
        glyph.advance  = _face->glyph->metrics.horiAdvance  / 64;

        // Convert to 32bpp ARGB for the texturizer.
        ScopedArray<u32> buffer(new u32[bmp.rows * bmp.width]);
        for (int i = 0; i < bmp.rows * bmp.width; i++) {
            u8 p = bmp.buffer[i];
            buffer[i] = (p << 24) | (p << 16) | (p << 8) | p;
        }

        glyph.tex = new Texture(bmp.width, bmp.rows, buffer.get());
        _glyphs[c] = glyph;
        return _glyphs[c];
    }
}