#ifndef PYR_MAP_ELEMENT_H
#define PYR_MAP_ELEMENT_H


#include <gmtl/Vec.h>
#include "Utility.h"


namespace pyr {

    // so std::vector<MapElementPtr> works
    class MapElement;
    typedef RefPtr<MapElement> MapElementPtr;
    

    class MapElement : public RefCounted {
    protected:
        ~MapElement() { }
    
    public:
        
    private:
        std::string _name;
        gmtl::Vec2f _position;
        std::vector<MapElementPtr> _children;
    };
    
}


#endif
