#ifndef PHUI_PICTURE_H
#define PHUI_PICTURE_H


#include <string>
#include "Texture.h"
#include "Widget.h"


namespace phui {

    class Picture : public Widget {
    public:
        Picture(const std::string& filename);
        
        void draw() const;
        
        bool isFocusable() const {
            return false;
        }
        
    private:
        pyr::Texture* _texture;
    };
    PYR_REF_PTR(Picture);
}


#endif
