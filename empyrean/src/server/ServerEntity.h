#ifndef PYR_SERVER_ENTITY_H
#define PYR_SERVER_ENTITY_H


#include <algorithm>
#include <gmtl/Vec.h>
#include <gmtl/VecOps.h>
#include "Types.h"


namespace pyr {

    class ServerEntity {
    public:
        ServerEntity(u16 id) {
            _id = id;
        }

        u16 getID() const {
            return _id;
        }

        std::string getAppearance() const {
            return "models/paladin/paladin.cfg";
        }
    
        void setPos(const gmtl::Vec2f& pos) { _pos = pos; }
        const gmtl::Vec2f& getPos() const   { return _pos; }

        void setVel(const gmtl::Vec2f& vel) { _vel = vel; }
        const gmtl::Vec2f& getVel() const   { return _vel; }
    
        void update(float dt) {
            _pos += _vel * dt;
            //_pos[1] = std::max(0.0f, _pos[1]);
            //_vel[1] -= 9.81f * dt;
        }
        
    private:
        u16 _id;
        gmtl::Vec2f _pos;
        gmtl::Vec2f _vel;
    };
    
}


#endif
