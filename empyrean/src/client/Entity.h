#ifndef PYR_ENTITY_H
#define PYR_ENTITY_H


#include <gmtl/Vec.h>
#include "Types.h"


namespace pyr {

    class Entity {
    public:
        virtual ~Entity() { }
    
        virtual void draw() { }
        virtual void update(float dt) { }
        
        gmtl::Vec2f& getPos()               { return _pos; }
        const gmtl::Vec2f& getPos() const   { return _pos; }
        void setPos(const gmtl::Vec2f& pos) { _pos = pos;  }
        
        gmtl::Vec2f& getVel()               { return _vel; }
        const gmtl::Vec2f& getVel() const   { return _vel; }
        void setVel(const gmtl::Vec2f& vel) { _vel = vel;  }
        
    private:
        gmtl::Vec2f _pos;
        gmtl::Vec2f _vel;
    };

}


#endif
