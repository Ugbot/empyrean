#include <gmtl/Vec.h>
#include <gmtl/VecOps.h>
#include <cal3d/cal3d.h>

#include "Input.h"
#include "InputManager.h"
#include "Model.h"
#include "OpenGL.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "ResourceManager.h"

namespace pyr {
    PlayerEntity::PlayerEntity(Model* model, Renderer* renderer, InputManager* im) {
        _model = model;
        _renderer = renderer;
	_direction = 0;
	
        if (im) {
            _inputLeft  = &im->getInput("Left");
            _inputRight = &im->getInput("Right");
        } else {
            _inputLeft = 0;
            _inputRight = 0;
        }

        startStandState();
    }

    void PlayerEntity::draw() {
        glEnable(GL_DEPTH_TEST);
        glRotatef(_direction + 180, 0, 1, 0);
        glRotatef(90, 1, 0, 0);
        //glScalef(0.01f, 0.01f, 0.01f);
        _renderer->draw(_model);
        glDisable(GL_DEPTH_TEST);
    }

    void PlayerEntity::update(float dt) {
	setPos(getPos() + getVel() * dt);
	if (_state) {
	    (this->*_state)(dt);
	}
        _model->update(dt);
    }

    static const float vel = 70.0f;

    void PlayerEntity::startStandState() {
        _model->getModel().getMixer()->clearCycle(0, 0.0f);
        setVel(gmtl::Vec2f(0,0));

        _state = &PlayerEntity::updateStandState;
    }
    
    void PlayerEntity::updateStandState(float dt) {
        if (_inputLeft && _inputLeft->getValue() != 0) {
            startWalkState();
        } else if (_inputRight && _inputRight->getValue() != 0) {
            startWalkState();
        } else {
            startStandState();
            return;
        }

        setPos(getPos() + (getVel() * dt));
    }

    void PlayerEntity::startWalkState() {
        _model->getModel().getMixer()->blendCycle(0, 1.0f, 5.0f);
        _state = &PlayerEntity::updateWalkState;
    }

    void PlayerEntity::updateWalkState(float dt) {
        if (_inputLeft && _inputLeft->getValue() != 0) {
            setVel(gmtl::Vec2f(-vel, 0));
            _direction = -90;
        } else if (_inputRight && _inputRight->getValue() != 0) {
            setVel(gmtl::Vec2f(vel, 0));
            _direction = 90;
        } else {
            startStandState();
            return;
        }

        setPos(getPos() + (getVel() * dt));
    }
}
