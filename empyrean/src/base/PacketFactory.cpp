#include "PacketFactory.h"
#include "PacketTypes.h"


namespace pyr {

    PacketFactory::PacketFactory() {
        #define PYR_REGISTER(name) registerType<name ## _NAME>();
        PYR_PACKET_LIST(PYR_REGISTER)
    }
    
    Packet* PacketFactory::create(int id, int size, void* buffer) {
        Factory f = _factoryMap[id];
        return (f ? f(size, buffer) : 0);
    }

}
