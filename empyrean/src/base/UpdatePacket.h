#ifndef PYR_UPDATE_PACKET_H
#define PYR_UPDATE_PACKET_H


#include <gmtl/Vec.h>
#include "BufferParser.h"
#include "Packet.h"


namespace pyr {

    class UpdatePacket : public Packet {
    public:
        enum { ID = 2 };
        
        UpdatePacket(
            u16 entity,
            const std::string& appearance,
            gmtl::Vec2f pos,
            gmtl::Vec2f vel)
        {
            _entity = entity;
            _appearance = appearance;
            _pos = pos;
            _vel = vel;
        }
        
        u16 getID() const {
            return ID;
        }
        
        const std::string& getAppearance() const {
            return _appearance;
        }
        
        const gmtl::Vec2f& getPos() const {
            return _pos;
        }
        
        const gmtl::Vec2f& getVel() const {
            return _vel;
        }
        
        void serialize(ByteBuffer& out) const {
            out.add_u16(_entity);
            out.add_string(_appearance, 12);
            out.add_float(_pos[0]);
            out.add_float(_pos[1]);
            out.add_float(_vel[0]);
            out.add_float(_vel[1]);
        }
        
        static Packet* create(int size, const void* bytes) {
            BufferParser bp(size, bytes);
            
            u16 entity = bp.read_u16();
            std::string appearance = bp.read_string(12);
            gmtl::Vec2f pos, vel;
            pos[0] = bp.read_float();
            pos[1] = bp.read_float();
            vel[0] = bp.read_float();
            vel[1] = bp.read_float();
            
            if (bp.reachedEnd()) {
                return 0;
            } else {
                return new UpdatePacket(entity, appearance, pos, vel);
            }
        }
        
    private:
        u16 _entity;
        std::string _appearance;
        gmtl::Vec2f _pos;
        gmtl::Vec2f _vel;
    };

}


#endif
