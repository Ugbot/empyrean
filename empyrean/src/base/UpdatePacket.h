#ifndef PYR_UPDATE_PACKET_H
#define PYR_UPDATE_PACKET_H


#include "Packet.h"


namespace pyr {

    class UpdatePacket : public Packet {
    public:
        enum { ID = 2 };
        
        u32 getID() {
            return ID;
        }
        
        void serialize(ByteBuffer& out) {
        }
        
        static Packet* create(int size, const void* bytes) {
            return new UpdatePacket();
        }
    };

}


#endif
