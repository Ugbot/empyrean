#ifndef PYR_PING_PACKET_H
#define PYR_PING_PACKET_H


#include "Packet.h"


namespace pyr {

    class PingPacket : public Packet {
    public:
        PYR_PACKET_ID(6);
        
        void serialize(ByteBuffer& out) const {
        }
                
        static Packet* create(int size, const void* bytes) {
            return new PingPacket();
        }
    };

}


#endif
