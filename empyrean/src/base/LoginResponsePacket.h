#ifndef PYR_LOGIN_RESPONSE_PACKET_H
#define PYR_LOGIN_RESPONSE_PACKET_H


#include "Packet.h"


namespace pyr {

    class LoginResponsePacket : public Packet {
    public:
        PYR_PACKET_ID(5);
    
        LoginResponsePacket(u16 entityID) {
            _entityID = entityID;
        }
        
        u16 getEntityID() const {
            return _entityID;
        }
        
        void serialize(ByteBuffer& out) const {
            out.add_u16(_entityID);
        }
        
        static Packet* create(int size, const void* bytes) {
            BufferParser bp(size, bytes);
            
            u16 entityID = bp.read_u16();
            if (bp.passedEnd()) {
                return 0;
            } else {
                return new LoginResponsePacket(entityID);
            }
        }
        
    private:
        u16 _entityID;
    };

}


#endif
