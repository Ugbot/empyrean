#include "PacketTypes.h"


namespace pyr {

    #define PYR_DEFINE(name)    \
        PYR_DEFINE_PACKET(name ## _NAME, name ## _ID, name)
    
    PYR_PACKET_LIST(PYR_DEFINE)

}
