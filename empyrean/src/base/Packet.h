#ifndef PYR_PACKET_H
#define PYR_PACKET_H


#include "ByteBuffer.h"
#include "Types.h"


namespace pyr {

    class Packet {
    public:
        virtual ~Packet() { }
        
        virtual u16 getID() const = 0;
        
        virtual u16 getSize() const {
            ByteBuffer bb;
            serialize(bb);
            return (u16)bb.getSize();
        }
        
        virtual void serialize(ByteBuffer& out) const = 0;
    };

}


#endif
