#ifndef PYR_PACKET_H
#define PYR_PACKET_H


#include "Types.h"


namespace pyr {

    class Packet {
    public:
        virtual ~Packet() { }
        
        virtual u32 getID() = 0;
        virtual u16 getSize() = 0;
        
        virtual void serialize(ByteBuffer& out);
    };

}


#endif
