#ifndef PYR_TEXMANAGER_H
#define PYR_TEXMANAGER_H

#include <map>
#include <string>

#include "Singleton.h"

namespace pyr {
    /**
     * Maybe I should have lifted texture code from the client.
     * Whatever.
     * Quicky texture management stuff.  Textures will be held onto forever,
     * unless TexManager.clear() is called, at which point all textures are discarded.
     */
    class Texture {
        friend class TexManager;
    public:
        int getHandle() const   { return _handle; }
        int getWidth()  const   { return _width;  }
        int getHeight() const   { return _height; }

    protected:
        Texture(unsigned handle, int width, int height);
        ~Texture();

    private:
        unsigned _handle;
        int _width;
        int _height;
    };

    // TexMex
    class TexManager {
        PYR_DECLARE_SINGLETON(TexManager)

    public:
        Texture* loadTex(const std::string& fileName);
        void clear();   // deallocates all cached textures

    private:
        TexManager();
        ~TexManager();

        typedef std::map<std::string, Texture*> TexMap;
        TexMap _textures;

        /*
         * the "couldn't load a texture texture".  This way, things still work, and we don't need to bother 
         * bitching every time a texture isn't there.  Maybe this approach isn't so hot.  I dunno.
         */
        Texture* _dummyTex;
    };
}

#endif