#ifndef PYR_PACKET_TYPES_H
#define PYR_PACKET_TYPES_H


#include <string>
#include <gmtl/Vec.h>
#include "Packet.h"


namespace pyr {

    // username length = 12...

    // PACKET DEFINITIONS

    #define PYR_CHAT_PACKET_NAME ChatPacket
    #define PYR_CHAT_PACKET(_)  \
        _(string)(12, username) \
        _(field)(u16, action)   \
        _(string)(512, text)
    
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
        _(string)(12, password)             \
        _(field)(u8, newAccount)
        

    // Login Response codes    
    enum {
        LR_LOGGED_IN,  // success
    
        LR_INVALID_USERNAME,
        LR_NO_ACCOUNT,
        LR_INVALID_PASSWORD,
        LR_ACCOUNT_TAKEN,
        LR_ALREADY_LOGGED_IN,
    };
    
    #define PYR_LOGIN_RESPONSE_PACKET_NAME LoginResponsePacket
    #define PYR_LOGIN_RESPONSE_PACKET(_)    \
        _(field)(u16, response)
        
        
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


    // PACKET LIST
    
    // Packet IDs are allocated based on the order of this list.
    #define PYR_PACKET_LIST(_)          \
        _(PYR_CHAT_PACKET)              \
        _(PYR_ENTITY_ADDED_PACKET)      \
        _(PYR_ENTITY_REMOVED_PACKET)    \
        _(PYR_LOGIN_PACKET)             \
        _(PYR_LOGIN_RESPONSE_PACKET)    \
        _(PYR_PING_PACKET)              \
        _(PYR_PLAYER_STATE_PACKET)      \
        _(PYR_UPDATE_PACKET)


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
