#ifndef PYR_CONSTANTS_H
#define PYR_CONSTANTS_H


#include "Types.h"


namespace pyr {
    namespace constants {
        const u16 SERVER_PORT = 14702;
        const float SERVER_DT = 0.050f;       // 20 frames per second.
        const float DT_CAP = 1.0;             // Seconds.
        const float FAST_COMBO = 0.11f;
        const float TERMINAL_VELOCITY = -56;  // Meters per second.
        const float GRAVITY = 9.81f;          // Meters per second per second.
    }

    namespace collision {
        const int FALLING_SPEED = 0;
        const int REGION_UNASSIGNED = -1;
        const float REGION_RADIUS = 4;
        const int REGION_END = -2;
    
        enum COLLISION_TYPE {
            NONE, GROUND_BELOW,GROUND_ABOVE, GROUND_HORIZ, ENTITY_ABOVE, ENTITY_BELOW, ENTITY_HORIZ, NOT_MOVING
        };
    }
}

#endif
