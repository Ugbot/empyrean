#include "EntityAddedPacket.h"
#include "EntityRemovedPacket.h"
#include "LoginPacket.h"
#include "LoginResponsePacket.h"
#include "PacketFactory.h"
#include "UpdatePacket.h"


namespace pyr {

    PacketFactory::PacketFactory() {
        registerType<EntityAddedPacket>();
        registerType<EntityRemovedPacket>();
        registerType<LoginPacket>();
        registerType<LoginResponsePacket>();
        registerType<UpdatePacket>();
    }
    
    Packet* PacketFactory::create(int id, int size, void* buffer) {
        Factory f = _factoryMap[id];
        return (f ? f(size, buffer) : 0);
    }

}
