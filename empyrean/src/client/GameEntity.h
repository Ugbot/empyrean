#ifndef PYR_GAME_ENTITY_H
#define PYR_GAME_ENTITY_H

#include <map>
#include "ClientEntity.h"
#include "Collider.h"
#include "Utility.h"
#include "Types.h"

namespace pyr {

    class InputManager;
    class Input;

    class GameEntity : public ClientEntity {
    public:
        enum Animation {
            ATTACKING,
            JUMPING,
            JUMPSTART,
            STANDING,
            WALKING     
        };

        GameEntity();

        void draw();
        void update(float dt, const Map* terrain);
        
    private:
        typedef void (GameEntity::*StateHandler)(float dt);
        StateHandler _state;

        void changeState(StateHandler* newstate);

        void phaseOutAnimation(Animation name);
        void correctDirection(float xvel);

        void startAttackState();
        void updateAttackState(float dt);

        void startJumpState();
        void updateJumpState(float dt);

        void startJumpStartState();
        void updateJumpStartState(float dt);

        void startStandState();
        void updateStandState(float dt);

        void startWalkState();
        void updateWalkState(float dt);

        /// Data from last collision detection test.  Used for debug drawing.
        CollisionData _lastCD;

        // Jumping animation information
        bool _jumpStart;
        float _jumpStartTime;

        // Attacking animation information
        bool _attackStart;
        float _attackingStartTime;
        float _origDirection;

        // Character Information
        float _direction;
    };

}

#endif
