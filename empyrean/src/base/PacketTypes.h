#ifndef PYR_PACKET_TYPES_H
#define PYR_PACKET_TYPES_H


#include <string>
#include "Packet.h"
#include "VecMath.h"


namespace pyr {

    const unsigned USERNAME_LENGTH = 32;
    const unsigned TEXT_LENGTH = 512;

    // PACKET DEFINITIONS

    // client -> server
    #define PYR_LOGIN_PACKET_NAME LoginPacket
    #define PYR_LOGIN_PACKET(_)                 \
        _(string)(USERNAME_LENGTH, username)    \
        _(string)(USERNAME_LENGTH, password)    \
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
    
    // server -> client
    #define PYR_LOGIN_RESPONSE_PACKET_NAME LoginResponsePacket
    #define PYR_LOGIN_RESPONSE_PACKET(_)    \
        _(field)(u16, response)
        
    // client -> server
    #define PYR_SAY_PACKET_NAME SayPacket
    #define PYR_SAY_PACKET(_)   \
        _(string)(TEXT_LENGTH, text)
        
    enum LobbyPacketCode {
        LOBBY_LOGIN,
        LOBBY_LOGOUT,
        LOBBY_SAY,
    };

    // server -> client
    #define PYR_LOBBY_PACKET_NAME LobbyPacket
    #define PYR_LOBBY_PACKET(_)                 \
        _(string)(USERNAME_LENGTH, username)    \
        _(field)(u16, action)                   \
        _(string)(TEXT_LENGTH, text)

    // This packet represents both creating a game and joining a game.
    // client -> server
    #define PYR_JOIN_GAME_PACKET_NAME JoinGamePacket
    #define PYR_JOIN_GAME_PACKET(_) \
        _(string)(24, name)         \
        _(string)(24, password)     \
        _(field)(u8, newGame)
        
    // Join Game Response codes
    enum {
        JGR_JOINED,     // success
        
        JGR_INVALID_NAME,
        JGR_NO_GAME,
        JGR_INVALID_PASSWORD,
        JGR_ALREADY_STARTED,
    };
    
    // server -> client
    #define PYR_JOIN_GAME_RESPONSE_PACKET_NAME JoinGameResponsePacket
    #define PYR_JOIN_GAME_RESPONSE_PACKET(_)  \
        _(field)(u16, code)

    // Player Event codes
    //   "Begin Left"
    //   "End Left"
    //   "Begin Right"
    //   "End Right
    //   "Jump"
    //   "Attack"

    // client -> server
    #define PYR_PLAYER_EVENT_PACKET_NAME PlayerEventPacket
    #define PYR_PLAYER_EVENT_PACKET(_) \
        _(string)(32, event)

    #define PYR_PLAYER_ATTACK_PACKET_NAME PlayerAttackPacket
    #define PYR_PLAYER_ATTACK_PACKET(_) \
        _(string)(32, name)             \
        _(string)(32, type)

    // client -> server //TEMP!!!!!
    #define PYR_TEMP_HUD_PACKET_NAME TempHUDPacket
    #define PYR_TEMP_HUD_PACKET(_)  \
        _(field)(u16, addVit)       \
        _(field)(u16, decVit)       \
        _(field)(u16, addEth)       \
        _(field)(u16, decEth)

    // server -> client
    #define PYR_SET_PLAYER_PACKET_NAME SetPlayerPacket
    #define PYR_SET_PLAYER_PACKET(_) \
        _(field)(u16, id)

    // server -> client
    #define PYR_ENTITY_ADDED_PACKET_NAME EntityAddedPacket
    #define PYR_ENTITY_ADDED_PACKET(_)     \
        _(field)(u16,  id)                 \
        _(string)(16,  behavior)           \
        _(string)(256, behaviorResource)   \
        _(string)(16,  appearance)         \
        _(string)(256, appearanceResource) \
        _(field)(Vec2f, boundsMin)         \
        _(field)(Vec2f, boundsMax)

    // server -> client
    #define PYR_ENTITY_REMOVED_PACKET_NAME EntityRemovedPacket
    #define PYR_ENTITY_REMOVED_PACKET(_) \
        _(field)(u16, id)

    // server -> client
    #define PYR_ENTITY_UPDATED_PACKET_NAME EntityUpdatedPacket
    #define PYR_ENTITY_UPDATED_PACKET(_) \
        _(field)(u16, id)                \
        _(field)(Vec2f, pos)             \
        _(field)(Vec2f, vel)

    // server -> client
    #define PYR_CHARACTER_UPDATED_PACKET_NAME CharacterUpdatedPacket
    #define PYR_CHARACTER_UPDATED_PACKET(_) \
        _(field)(u16, id)                   \
        _(field)(u16, currVit)              \
        _(field)(u16, maxVit)               \
        _(field)(u16, currEth)              \
        _(field)(u16, maxEth)

    enum AppearancePacketCode {
        AP_COMMAND,
        AP_ANIMATION,
        AP_ANIMATION_CYCLE,
    };

    // server -> client
    #define PYR_APPEARANCE_PACKET_NAME AppearancePacket
    #define PYR_APPEARANCE_PACKET(_)    \
        _(field)(u16, id)               \
        _(field)(u16, code)             \
        _(string)(256, str)


    // PACKET LIST
    
    // Packet IDs are allocated based on the order of this list.
    #define PYR_PACKET_LIST(_)                  \
        _(PYR_LOGIN_PACKET)                     \
        _(PYR_LOGIN_RESPONSE_PACKET)            \
        _(PYR_SAY_PACKET)                       \
        _(PYR_LOBBY_PACKET)                     \
        _(PYR_JOIN_GAME_PACKET)                 \
        _(PYR_JOIN_GAME_RESPONSE_PACKET)        \
        _(PYR_PLAYER_EVENT_PACKET)              \
        _(PYR_SET_PLAYER_PACKET)                \
        _(PYR_ENTITY_ADDED_PACKET)              \
        _(PYR_ENTITY_REMOVED_PACKET)            \
        _(PYR_ENTITY_UPDATED_PACKET)            \
        _(PYR_APPEARANCE_PACKET)                \
        _(PYR_CHARACTER_UPDATED_PACKET)         \
        _(PYR_TEMP_HUD_PACKET)                  \
        _(PYR_PLAYER_ATTACK_PACKET)


    // allocate packet IDs

    #define PYR_ID(name) name ## _ID,
    enum {
        PYR_PACKET_LIST(PYR_ID)
    };
    
    
    // declare packet types
    
    #define PYR_DECLARE(name) PYR_DECLARE_PACKET(name ## _NAME, name ## _ID, name)
    PYR_PACKET_LIST(PYR_DECLARE)
}


#endif
