#include "ClientEntity.h"


namespace pyr {

    void ClientEntity::update(float dt, const Environment& env) {
        Entity::update(dt, env);
        getClientAppearance()->update(dt);
    }

    void ClientEntity::draw() const {
        getClientAppearance()->draw();

#if 0
        // Render player bounding box [debugging].

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
        glEnd();
#endif
    }

    void ClientEntity::getVitalityUpdate(int& current, int& max) {
        current = _currentVitality;
        max = _maxVitality;
    }

    void ClientEntity::getEtherUpdate(int& current, int& max) {
        current = _currentEther;
        max = _maxEther;
    }

}
