#include <algorithm>
#include <gmtl/gmtl.h>
#include <cal3d/cal3d.h>

#include "Collider.h"
#include "Input.h"
#include "InputManager.h"
#include "Model.h"
#include "OpenGL.h"
#include "PlayerEntity.h"
#include "Renderer.h"
#include "ResourceManager.h"
#include "VecMath.h"

namespace pyr {
    PlayerEntity::PlayerEntity(Model* model, Renderer* renderer) {
        _model = model;
        _renderer = renderer;
        _direction = 0;

        startStandState();
    }

    void PlayerEntity::draw() {
        glPushMatrix();
        glEnable(GL_DEPTH_TEST);
        glRotatef(_direction + 180, 0, 1, 0);
        glRotatef(90, 1, 0, 0);
        glScalef(1, 1, -1);
        _renderer->draw(_model);
        glDisable(GL_DEPTH_TEST);
        glPopMatrix();
        float height = 1.9f;
        float width = 0.3f;
        
        glBegin(GL_LINE_LOOP);
        glVertex2f(-width/2.0,0);
        glVertex2f(width/2.0,0);
        glVertex2f(width/2.0,height);
        glVertex2f(-width/2.0,height);
        glEnd();
    }

    void PlayerEntity::update(float dt, const Map* terrain) {
        // Provide client-side estimation of server physics model.
	Vec2f origPos = getPos();

        getPos() += getVel() * dt;
	getPos()[1] = std::max(getPos()[1], 0.0f);
	getVel()[1] -= 9.81f * dt;
	    
        float height = 1.9f;
        float width = 0.3f;
    
        collide(origPos, getPos(), getVel(), width, height, terrain);

        if (_state) {
            (this->*_state)(dt);
        }
        _model->update(dt);
    }

    void PlayerEntity::startStandState() {
        _model->getModel().getMixer()->clearCycle(0, 0.0f);
        _state = &PlayerEntity::updateStandState;
    }
    
    void PlayerEntity::updateStandState(float dt) {
        float xvel = getVel()[0];
        if (gmtl::Math::abs(xvel) > gmtl::GMTL_EPSILON) {
            startWalkState();
        }
    }

    void PlayerEntity::startWalkState() {
        _model->getModel().getMixer()->blendCycle(0, 1.0f, 5.0f);
        _state = &PlayerEntity::updateWalkState;
    }

    void PlayerEntity::updateWalkState(float dt) {
        float xvel = getVel()[0];
        if (gmtl::Math::abs(xvel) < gmtl::GMTL_EPSILON) {
            startStandState();
        } else if (xvel > 0) {
            _direction = 90;
        } else {
            _direction = -90;
        }
    }
}
