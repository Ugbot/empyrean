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
#include "Coroutine.h"

namespace pyr {
    PlayerEntity::PlayerEntity(Model* model,Renderer* renderer,InputManager* im) {
        _model = model;
        _renderer = renderer;
        _im = im;
        _inputLeft = &_im->getInput("Left");
        _inputRight = &_im->getInput("Right");
        _inputAttack = &im->getInput("Space");

        changeState(&PlayerEntity::standState);
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
        (this->*_stateFn)(dt);

        if (_inputAttack->getValue()==1.0f) {
            _model->getModel().getMixer()->executeAction(1, 0.5f, 1.0f);
        }

        _model->update(dt);
    }

    const float vel=70.0f;

    void PlayerEntity::walkState(float dt) {
        crBegin();

        _model->getModel().getMixer()->blendCycle(0, 1.0f, 5.0f);

        while (true) {
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
                changeState(&PlayerEntity::standState);
                return;
            }

            setPos(getPos() + (getVel() * dt));
            crReturnVoid();
        }

        crFinish();
    }

    void PlayerEntity::standState(float dt) {
        crBegin();
        _model->getModel().getMixer()->clearCycle(0, 0.0f);
        setVel(gmtl::Vec2f(0,0));

        while (true) {
            if (_inputLeft->getValue() != 0) {
                _direction = 90;
                setVel(gmtl::Vec2f(-vel, 0));
                changeState(&PlayerEntity::walkState);
                return;
            }
            else if (_inputRight->getValue() != 0) {
                _direction = -90;
                setVel(gmtl::Vec2f(vel, 0));
                changeState(&PlayerEntity::walkState);
                return;
            }

            crReturnVoid();
        }

        crFinish();
    }

    void PlayerEntity::changeState(PlayerEntity::StateHandler fn) {
        _state = 0;
        _stateFn = fn;
    }
}
