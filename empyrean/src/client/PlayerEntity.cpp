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
    PlayerEntity::PlayerEntity(Model* model,Renderer* renderer,InputManager* im) {
        _model = model;
        _renderer = renderer;
        _im = im;
        _inputLeft = &_im->getInput("Left");
        _inputRight = &_im->getInput("Right");

        _state = walkState;
    }

    PlayerEntity::~PlayerEntity() {
    }

    void PlayerEntity::draw() {
        Renderer::begin3D();
        glRotatef(_direction,0,1,0);
        glRotatef(90,1,0,0);
        _renderer->draw(_model);
        Renderer::end3D();
    }

    void PlayerEntity::update(float dt) {
        (this->*_state)(dt);

        _model->update(dt);
    }

    static const float vel=70.0f;

    void PlayerEntity::walkState(float dt) {
        if (_inputLeft->getValue()!=0) {
            setVel(gmtl::Vec2f(-vel,0));
            _direction=90;
        }
        else if (_inputRight->getValue()!=0) {
            setVel(gmtl::Vec2f(vel,0));
            _direction=-90;
        }
        else
        {
            setVel(gmtl::Vec2f(0,0));
            _model->getModel().getMixer()->clearCycle(0, 0.0f);
            _state=standState;
        }

        gmtl::Vec2f p=getPos();
        setPos(p + (getVel() * dt));
    }

    void PlayerEntity::standState(float dt) {
        if (_inputLeft->getValue() != 0) {
            _direction = 90;
            setVel(gmtl::Vec2f(-vel, 0));
        }
        else if (_inputRight->getValue() != 0) {
            _direction = -90;
            setVel(gmtl::Vec2f(vel, 0));
        }

        if (gmtl::length(getVel())!=0) {
            _model->getModel().getMixer()->blendCycle(0, 1.0f, 5.0f);
            _state=walkState;
        }
    }
}