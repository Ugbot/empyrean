#include <algorithm>
#include <gmtl/gmtl.h>
#include <cal3d/cal3d.h>

#include "Collider.h"
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

const int FALLING_SPEED = 0;

namespace pyr {

    GameEntity::GameEntity(Model* model, Renderer* renderer) {
        _model = model;
        _renderer = renderer;
        _direction = 90;

        // Initializing frenzy! // TEMP TESTING -> real values commented out
        _currentEther = 25; //0;
        _maxEther = 100; //0;
        _currentVitality = 10; //0;
        _maxVitality = 100; //0;
        _jumpStart = false;
        _attackStart = false;
        getHeight() = 1.9f;
        getWidth() = 0.3f;
        startStandState();
    }

    void GameEntity::decrVitality(int decr) {
        _currentVitality -= decr;
        if (_currentVitality < 0) {
            _currentVitality = 0;
        }
    }

    void GameEntity::incrVitality(int incr) {
        _currentVitality += incr;
        if (_currentVitality > _maxVitality) {
            _currentVitality = _maxVitality;
        }
    }

    void GameEntity::decrEther(int decr) {
        _currentEther -= decr;
        if (_currentEther < 0) {
            _currentEther = 0;
        }
    }

    void GameEntity::incrEther(int incr) {
        _currentEther += incr;
        if (_currentEther > _maxEther) {
            _currentEther = _maxEther;
        }
    }

    void GameEntity::draw() {
        // Render player model.
        glPushMatrix();
        glEnable(GL_DEPTH_TEST);
        glRotatef(_direction + 180, 0, 1, 0);
        glRotatef(90, 1, 0, 0);
        glScalef(1, 1, -1);
        _renderer->draw(_model);
        glDisable(GL_DEPTH_TEST);
        glPopMatrix();
        
/*
        // Render player bounding box [debugging].
        float height = 1.9f;
        float width = 0.3f;

        glBegin(GL_LINE_LOOP);
        glVertex2f(-width/2,0);
        glVertex2f(width/2,0);
        glVertex2f(width/2,height);
        glVertex2f(-width/2,height);
        glEnd();

        // Render last collision data [debugging].
        glColor3f(1, 0, 0);
        glBegin(GL_LINES);
        for (size_t i = 0; i < _lastCD.interesting.size(); ++i) {
            glVertex(_lastCD.interesting[i].v1 - getPos());
            glVertex(_lastCD.interesting[i].v2 - getPos());
        }
        glEnd();

        glColor3f(0, 1, 0);
        glBegin(GL_POINTS);
        for (size_t i = 0; i < _lastCD.points.size(); ++i) {
            glVertex(_lastCD.points[i] - getPos());
        }
        glEnd();*/
    }

    void GameEntity::update(float dt, const Map* terrain) {
        // Provide client-side estimation of server physics model.
        Vec2f origPos = getPos();
        
        getPos() += getVel() * dt;
        getVel()[1] -= 9.81f * dt;             // gravity
        if(getVel()[1] < -56) {                // terminal velocity
            getVel()[1] = -56;
        }
       
        // For testing to see if jumping is done
        Vec2f precollideposition = getPos();
        Vec2f precollidevelocity = getVel();

        _lastCD = collide(dt, origPos, getPos(), getVel(), getWidth(), getHeight(), terrain);

        // If you are higher than you once were so you were forced up and you were falling 
        // (before the collision) This means that you hit a surface below you so therefore 
        // reset jumping
        if((precollideposition[1]-getPos()[1]) < 0 && precollidevelocity[1] < FALLING_SPEED) {
             getJumping() = 0;
        }

        if (_state) {
            (this->*_state)(dt);
        }
        _model->update(dt);
    }

    // Action Functions
    bool GameEntity::jump() {
         if(getJumping() < 2) {
            getJumping()++;
            getVel()[1] = 8;
            _jumpStart = true;
            return true;
        }
        return false;
    }
        
    bool GameEntity::attack() {
        if(_attackStart) {
            return false; // already attacking can't attack right now
        }
        
        _attackStart = true;
        return true;
    }

    // Utitlity Animation functions
    void GameEntity::phaseOutAnimation(Animation name) {
        _model->getModel().getMixer()->clearCycle((int) name, 0.0f);
    }

    void GameEntity::correctDirection(float xvel) {
        if (xvel > 0) {
            _direction = 90;
        } else if (xvel < 0) {
            _direction = -90;
        }
    }

    // Attack state transition in
    void GameEntity::startAttackState() {
        _model->getModel().getMixer()->blendCycle(ATTACKING, 1.0f, 10.0f);
        _attackingStartTime = 0;
        _state = &GameEntity::updateAttackState;
    }

    // Attack state
    //
    // Entered From: Jump Start, Jumping, Walking, Standing
    // Transitions to: Jump Start, Jumping, Walking, Standing
    // Purpose: Attacking animation
    //
    void GameEntity::updateAttackState(float dt) {
        float xvel = getVel()[0];
        if(_attackingStartTime > 0.5) {
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
        correctDirection(xvel);
    }
    
    // Jump state transition in
    void GameEntity::startJumpState() {
        _model->getModel().getMixer()->blendCycle(JUMPING, 1.0f, 10.0f);
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
    }

    // Jump start state transition in
    void GameEntity::startJumpStartState() {
        _model->getModel().getMixer()->blendCycle(JUMPSTART, 1.0f, 10.0f);
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
        correctDirection(xvel);
    }

    // Stand state transition in
    void GameEntity::startStandState() {
        _model->getModel().getMixer()->blendCycle(STANDING, 1.0f, 10.0f);
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
        _model->getModel().getMixer()->blendCycle(WALKING, 1.0f, 5.0f);
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
        correctDirection(xvel);
    }

    void GameEntity::getVitalityUpdate(int& current, int& max) {
        current = _currentVitality;
        max = _maxVitality;
    }

    void GameEntity::getEtherUpdate(int& current, int& max) {
        current = _currentEther;
        max = _maxEther;
    }
}
