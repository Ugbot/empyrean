#include "LoginPacket.h"
#include "PacketFactory.h"


namespace pyr {

    PacketFactory::PacketFactory() {
        registerType<LoginPacket>();
    }
    
    Packet* PacketFactory::create(int id, int size, void* buffer) {
        Factory f = _factoryMap[id];
        return (f ? f(size, buffer) : 0);
    }

}
