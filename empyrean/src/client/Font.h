#ifndef PYR_FONT_H
#define PYR_FONT_H

#include <string>
#include <sstream>
#include <map>

#include <gmtl/Vec.h>
// This sucks.  I wish I didn't have to include these here.
#include "ft2build.h"
#include FT_FREETYPE_H

namespace pyr {

    class Texture;

    // Unicode?
    class Font {
    public:

        enum Style {
            plain = 0,
            bold  = 1,
            italic= 2,
            bolditalic = bold | italic
        };

        Font(const std::string& face, int size, Style style = plain);
        ~Font();

        const gmtl::Vec2f& getPos() const;
        void setPos(const gmtl::Vec2f& pos);

        float getScale() const;
        void setScale(float scale);

        void printString(const std::string& s);

        Font& operator << (const std::string& s);
        Font& operator << (int i);
        Font& operator << (float v);

    protected:
        struct Glyph {
            Texture* tex;
            int bearingX;
            int bearingY;
            int advance;
        };

        typedef std::map<char,Glyph> GlyphMap;

        FT_Face     _face;
        GlyphMap    _glyphs;
        gmtl::Vec2f _pos;
        float       _scale;

        Glyph& getGlyph(char c);

        static FT_Library _library;
        static int _refCount;
    };

}


#endif