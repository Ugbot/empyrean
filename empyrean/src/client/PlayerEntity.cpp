#include <algorithm>
#include <gmtl/gmtl.h>
#include <cal3d/cal3d.h>

#include "Collider.h"
#include "GLUtility.h"
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

    void PlayerEntity::update(float dt, const Map* terrain) {
        // Provide client-side estimation of server physics model.
        Vec2f origPos = getPos();

        getPos() += getVel() * dt;
        getVel()[1] -= 9.81f * dt;             // gravity
        if(getVel()[1] < -56) {                // terminal velocity
            getVel()[1] = -56;
        }
        float height = 1.9f;
        float width = 0.3f;

        _lastCD = collide(dt, origPos, getPos(), getVel(), width, height, terrain);

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
