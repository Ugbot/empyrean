#include <gmtl/Vec.h>
#include <gmtl/VecOps.h>
#include <cal3d/cal3d.h>

#include "extgl.h"
#include "Input.h"
#include "InputManager.h"
#include "Model.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "ResourceManager.h"

namespace pyr {
    PlayerEntity::PlayerEntity(Model* model, Renderer* renderer) {
        _model = model;
        _renderer = renderer;

        startStandState();
    }

    PlayerEntity::~PlayerEntity() {
    }

    void PlayerEntity::draw() {
        glEnable(GL_DEPTH_TEST);
        glRotatef(_direction,0,1,0);
        glRotatef(90,1,0,0);
        _renderer->draw(_model);
        glDisable(GL_DEPTH_TEST);
    }

    void PlayerEntity::update(float dt) {
        (this->*_state)(dt);

/*
        if (_inputAttack->getValue()==1.0f) {
            _model->getModel().getMixer()->executeAction(1, 0.5f, 1.0f);
        }
*/

        _model->update(dt);
    }

    const float vel=70.0f;

    void PlayerEntity::startStandState() {
        _model->getModel().getMixer()->clearCycle(0, 0.0f);
        setVel(gmtl::Vec2f(0,0));

        _state = &PlayerEntity::updateStandState;
    }

    void PlayerEntity::updateStandState(double dt) {
/*
        if (_inputLeft->getValue() != 0) {
            _direction = 90;
            setVel(gmtl::Vec2f(-vel, 0));
            startWalkState();
        }
        else if (_inputRight->getValue() != 0) {
            _direction = -90;
            setVel(gmtl::Vec2f(vel, 0));
            startWalkState();
        }
*/
    }

    void PlayerEntity::startWalkState() {
        _model->getModel().getMixer()->blendCycle(0, 1.0f, 5.0f);
        _state = &PlayerEntity::updateWalkState;
    }

    void PlayerEntity::updateWalkState(double dt) {
/*
        if (_inputLeft->getValue()!=0) {
            setVel(gmtl::Vec2f(-vel,0));
            _direction=90;
        }
        else if (_inputRight->getValue()!=0) {
            setVel(gmtl::Vec2f(vel,0));
            _direction=-90;
        }
        else {
            startStandState();
            return;
        }
*/

        setPos(getPos() + (getVel() * dt));
    }
}
