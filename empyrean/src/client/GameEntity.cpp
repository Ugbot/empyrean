#include <algorithm>
#include <gmtl/gmtl.h>
#include <cal3d/cal3d.h>

#include "Collider.h"
#include "Constants.h"
#include "GLUtility.h"
#include "Input.h"
#include "InputManager.h"
#include "Model.h"
#include "OpenGL.h"
#include "GameEntity.h"
#include "Renderer.h"
#include "ResourceManager.h"
#include "VecMath.h"
#include "Log.h"

namespace pyr {

    GameEntity::GameEntity()
        : ClientEntity(0, 0)
    {
        // initialize other values
        _jumpStart = false;
        _attackStart = false;
        startStandState();
    }

    void GameEntity::update(float dt, const Map* terrain) {
        if (_state) {
            (this->*_state)(dt);
        }
    }

/*
    bool GameEntity::attack() {
        if(_attackStart) {
            return false; // already attacking can't attack right now
        }

        _attackStart = true;
        return true;
    }
*/
    // Utitlity Animation functions
    void GameEntity::phaseOutAnimation(Animation name) {
        //_model->getModel().getMixer()->clearCycle((int) name, 0.1f);
    }

    // Attack state transition in
    void GameEntity::startAttackState() {
        //_model->getModel().getMixer()->executeAction(ATTACKING, 0.1f, 0.1f);
        _attackingStartTime = 0;
        //_origDirection = _direction;
        _state = &GameEntity::updateAttackState;
    }

    // Attack state
    //
    // Entered From: Jump Start, Jumping, Walking, Standing
    // Transitions to: Jump Start, Jumping, Walking, Standing
    // Purpose: Attacking animation
    //
    void GameEntity::updateAttackState(float dt) {
        /*
        float xvel = getVel()[0];
        _attackingStartTime += dt;
        if(_attackingStartTime > 2.0) {
            _attackStart = false;
            phaseOutAnimation(ATTACKING);
            if (_jumpStart) {
                startJumpStartState();
            }
            else if(getJumping() > 0) {
                startJumpState();
            }
            else if (gmtl::Math::abs(xvel) > gmtl::GMTL_EPSILON) {
                startWalkState();
            }
            else {
                startStandState();
            }
        }
        */

        //correctDirection(xvel);
    }

    // Jump state transition in
    void GameEntity::startJumpState() {
        //_model->getModel().getMixer()->blendCycle(JUMPING, 1.0f, 0.1f);
        _jumpStart = false;
        _state = &GameEntity::updateJumpState;
    }

    // Jump state
    //
    // Entered From: Jump Start State
    // Transitions to: Walking, Standing, Attacking
    // Purpose: Main Part of Jump Animation
    //
    void GameEntity::updateJumpState(float dt) {
        /*
        float xvel = getVel()[0];
        if(_attackStart) {
            phaseOutAnimation(JUMPING);
            startAttackState();
        }
        else if(_jumpStart) {
           phaseOutAnimation(JUMPING);
           startJumpStartState();
        }
        else if(getJumping() == 0) {
            phaseOutAnimation(JUMPING);
            if (gmtl::Math::abs(xvel) > gmtl::GMTL_EPSILON) {
                startWalkState();
            }
            else {            
                startStandState();
            }
        }
        correctDirection(xvel);
        */
    }

    // Jump start state transition in
    void GameEntity::startJumpStartState() {
        //_model->getModel().getMixer()->blendCycle(JUMPSTART, 1.0f, 0.1f);
        _jumpStart = false;
        _state = &GameEntity::updateJumpStartState;
        _jumpStartTime = 0;
    }

    // Jump start state
    //
    // Entered From: Walking and Standing
    // Transitions to: Jump state after initial jump animation and Attacking
    // Purpose: Start the jump animation
    //
    void GameEntity::updateJumpStartState(float dt) {
        float xvel = getVel()[0];
        _jumpStartTime += dt;
        if(_attackStart) {
            phaseOutAnimation(JUMPSTART);
            startAttackState();
        }
        else if(_jumpStartTime > 0.5) {
            phaseOutAnimation(JUMPSTART);
            startJumpState();
        }
        //correctDirection(xvel);
    }

    // Stand state transition in
    void GameEntity::startStandState() {
        //_model->getModel().getMixer()->blendCycle(STANDING, 1.0f, 0.1f);
        _state = &GameEntity::updateStandState;
    }
    
    // Stand state
    //
    // Entered From: Walking and Jumping
    // Transitions to: Walking and Jump Start and Attacking
    // Purpose: Idle animation
    //
    void GameEntity::updateStandState(float dt) {
        float xvel = getVel()[0];
        if(_attackStart) {
            phaseOutAnimation(STANDING);
            startAttackState();
        }
        else if (_jumpStart) {
            phaseOutAnimation(STANDING);
            startJumpStartState();
        }
        else if (gmtl::Math::abs(xvel) > gmtl::GMTL_EPSILON) {
            phaseOutAnimation(STANDING);
            startWalkState();
        }
    }

    // Walk state transition in
    void GameEntity::startWalkState() {
        //_model->getModel().getMixer()->blendCycle(WALKING, 1.0f, 0.1f);
        _state = &GameEntity::updateWalkState;
    }

    // Walk state
    //
    // Entered From: Jump State and Stand state
    // Transitions to: Standing and Jump Start and Attacking
    // Purpose: Walking animation
    //
    void GameEntity::updateWalkState(float dt) {
        float xvel = getVel()[0];
        if(_attackStart) {
            phaseOutAnimation(WALKING);
            startAttackState();
        }
        else if (_jumpStart) {
            phaseOutAnimation(WALKING);
            startJumpStartState();
        } else if (gmtl::Math::abs(xvel) < gmtl::GMTL_EPSILON) {
            phaseOutAnimation(WALKING);
            startStandState();
        } 
        //correctDirection(xvel);
    }

}
