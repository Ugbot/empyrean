#ifndef PYR_PACKET_TYPES_H
#define PYR_PACKET_TYPES_H


#include <string>
#include <gmtl/Vec.h>
#include "Packet.h"


namespace pyr {

    // username length = 12...

    // PACKET DEFINITIONS

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
        
    #define PYR_SAY_PACKET_NAME SayPacket
    #define PYR_SAY_PACKET(_) \
        _(string)(512, text)
        
    enum {
        LOBBY_LOGIN,
        LOBBY_LOGOUT,
        LOBBY_SAY,
    };

    #define PYR_LOBBY_PACKET_NAME LobbyPacket
    #define PYR_LOBBY_PACKET(_) \
        _(string)(12, username) \
        _(field)(u16, action)   \
        _(string)(512, text)

    // This packet represents both creating a game and joining a game.
    #define PYR_JOIN_GAME_PACKET_NAME JoinGamePacket
    #define PYR_JOIN_GAME_PACKET(_)     \
        _(string)(24, name)             \
        _(string)(24, password)         \
        _(field)(u8, newGame)
        
    // Join Game Response codes
    enum {
        JGR_JOINED,     // success
        
        JGR_INVALID_NAME,
        JGR_NO_GAME,
        JGR_INVALID_PASSWORD,
        JGR_ALREADY_STARTED,
    };
    
    #define PYR_JOIN_GAME_RESPONSE_PACKET_NAME JoinGameResponsePacket
    #define PYR_JOIN_GAME_RESPONSE_PACKET(_)  \
        _(field)(u16, code)


    // PACKET LIST
    
    // Packet IDs are allocated based on the order of this list.
    #define PYR_PACKET_LIST(_)              \
        _(PYR_LOGIN_PACKET)                 \
        _(PYR_LOGIN_RESPONSE_PACKET)        \
        _(PYR_SAY_PACKET)                   \
        _(PYR_LOBBY_PACKET)                 \
        _(PYR_JOIN_GAME_PACKET)             \
        _(PYR_JOIN_GAME_RESPONSE_PACKET)


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
