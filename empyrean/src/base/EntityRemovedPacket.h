#ifndef ENTITY_REMOVED_PACKET_H
#define ENTITY_REMOVED_PACKET_H


#include "ByteBuffer.h"
#include "Packet.h"


namespace pyr {

    class EntityRemovedPacket : public Packet {
    public:
        PYR_PACKET_ID(4);
        
        EntityRemovedPacket(u32 entityID) {
            _entityID = entityID;
        }
        
        u32 getEntityID() const {
            return _entityID;
        }
        
        void serialize(ByteBuffer& out) const {
            out.add_u32(_entityID);
        }
        
        static Packet* create(int size, const void* bytes) {
            BufferParser bp(size, bytes);
            
            u32 entityID = bp.read_u32();
            
            if (bp.passedEnd()) {
                return 0;
            } else {
                return new EntityRemovedPacket(entityID);
            }
        }
        
    private:
        u32 _entityID;
    };

}


#endif
