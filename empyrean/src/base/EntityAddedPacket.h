#ifndef ENTITY_ADDED_PACKET_H
#define ENTITY_ADDED_PACKET_H


#include <string>
#include <gmtl/Vec.h>
#include "BufferParser.h"
#include "ByteBuffer.h"
#include "Packet.h"


namespace pyr {

    class EntityAddedPacket : public Packet {
    public:
        PYR_PACKET_ID(3);
    
        EntityAddedPacket(
            const std::string& appearance,
            u32 entityID,
            const gmtl::Vec2f& pos,
            const gmtl::Vec2f& vel)
        {
            _appearance = appearance;
            _entityID = entityID;
            _pos = pos;
            _vel = vel;
        }
        
        const std::string& getAppearance() const {
            return _appearance;
        }
        
        const u32 getEntityID() const {
            return _entityID;
        }
        
        const gmtl::Vec2f& getPos() const { 
            return _pos;
        }
        
        const gmtl::Vec2f& getVel() const { 
            return _vel;
        }
        
        void serialize(ByteBuffer& out) const {
            out.add_string(_appearance, 256);
            out.add_u32(_entityID);
            out.add_float(_pos[0]);
            out.add_float(_pos[1]);
            out.add_float(_vel[0]);
            out.add_float(_vel[1]);
        }
        
        static Packet* create(int size, const void* bytes) {
            BufferParser bp(size, bytes);
            
            std::string appearance = bp.read_string(256);
            u32 entityID = bp.read_u32();
            gmtl::Vec2f pos, vel;
            pos[0] = bp.read_float();
            pos[1] = bp.read_float();
            vel[0] = bp.read_float();
            vel[1] = bp.read_float();
            
            if (bp.passedEnd()) {
                return 0;
            } else {
                return new EntityAddedPacket(appearance, entityID, pos, vel);
            }
        }
        
    private:
        std::string _appearance;
        u32 _entityID;
        gmtl::Vec2f _pos;
        gmtl::Vec2f _vel;
    };

}


#endif
