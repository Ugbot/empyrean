#ifndef PYR_PACKET_TYPES_H
#define PYR_PACKET_TYPES_H


#include <string>
#include <gmtl/Vec.h>
#include "Packet.h"


namespace pyr {

    #define PYR_CREATE_ACCOUNT_PACKET_NAME CreateAccountPacket
    #define PYR_CREATE_ACCOUNT_PACKET(_)    \
        _(string)(12, username)             \
        _(string)(12, password)

    #define PYR_ENTITY_ADDED_PACKET_NAME EntityAddedPacket
    #define PYR_ENTITY_ADDED_PACKET(_)      \
        _(string)(256, appearance)          \
        _(field)(u32, entityID)             \
        _(field)(gmtl::Vec2f, pos)          \
        _(field)(gmtl::Vec2f, vel)
        
    #define PYR_ENTITY_REMOVED_PACKET_NAME EntityRemovedPacket
    #define PYR_ENTITY_REMOVED_PACKET(_)    \
        _(field)(u32, entityID)
        
    #define PYR_LOGIN_PACKET_NAME LoginPacket
    #define PYR_LOGIN_PACKET(_)             \
        _(string)(12, username)             \
        _(string)(12, password)
        
    #define PYR_LOGIN_RESPONSE_PACKET_NAME LoginResponsePacket
    #define PYR_LOGIN_RESPONSE_PACKET(_)    \
        _(field)(u16, entityID)
        
    #define PYR_PING_PACKET_NAME PingPacket
    #define PYR_PING_PACKET(_)
    
    #define PYR_PLAYER_STATE_PACKET_NAME PlayerStatePacket
    #define PYR_PLAYER_STATE_PACKET(_)                                      \
        /* This is the force component on the x axis.  It is directly */    \
        /* related to the left and right arrow keys. */                     \
        _(field)(float, force)
        
    #define PYR_UPDATE_PACKET_NAME UpdatePacket
    #define PYR_UPDATE_PACKET(_)    \
        _(field)(u16, entityID)     \
        _(field)(gmtl::Vec2f, pos)  \
        _(field)(gmtl::Vec2f, vel)



#if 1
    // Packet IDs are allocated based on the order of this list.
    #define PYR_PACKET_LIST(_)          \
        _(PYR_CREATE_ACCOUNT_PACKET)    \
        _(PYR_ENTITY_ADDED_PACKET)      \
        _(PYR_ENTITY_REMOVED_PACKET)    \
        _(PYR_LOGIN_PACKET)             \
        _(PYR_LOGIN_RESPONSE_PACKET)    \
        _(PYR_PING_PACKET)              \
        _(PYR_PLAYER_STATE_PACKET)      \
        _(PYR_UPDATE_PACKET)

#else
    #define PYR_PACKET_LIST(_) _(PYR_PING_PACKET)
#endif


    // allocate packet IDs

    #define PYR_ID(name) name ## _ID,
    
    enum {
        PYR_PACKET_LIST(PYR_ID)
    };
    
    
    // declare packet types
    
    #define PYR_DECLARE(name)   \
        PYR_DECLARE_PACKET(name ## _NAME, name ## _ID, name)

    PYR_PACKET_LIST(PYR_DECLARE)
}


#endif
