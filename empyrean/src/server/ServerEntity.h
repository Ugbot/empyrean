#ifndef PYR_SERVER_ENTITY_H
#define PYR_SERVER_ENTITY_H

#include <algorithm>
#include <string>
#include "VecMath.h"
#include "Types.h"
#include "Utility.h"

namespace pyr {

    class Map;

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
        gmtl::Vec2f& getPos()               { return _pos; }
        const gmtl::Vec2f& getPos() const   { return _pos; }

        void setVel(const gmtl::Vec2f& vel) { _vel = vel; }
        gmtl::Vec2f& getVel()               { return _vel; }
        const gmtl::Vec2f& getVel() const   { return _vel; }
    
        u16& jumping() { return _jumping; }
        const u16& jumping() const { return _jumping; }

        void update(float dt, Map* terrain);
        
    private:
        u16 _id;
        Vec2f _pos;
        Vec2f _vel;
        Zeroed<u16> _jumping;
    };
    
}

#endif
