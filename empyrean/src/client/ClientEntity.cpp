#include "ClientEntity.h"
#include "GLUtility.h"
#include "OpenGL.h"
#include "Log.h"

namespace pyr {

    void ClientEntity::update(float dt, const Environment& env) {
        Entity::update(dt, env);
        getClientAppearance()->update(dt);

        // Reduce the display time for the numbers
        if (_timeToShowVitChange > 0) {
            _timeToShowVitChange -= dt;
            if (_timeToShowVitChange < 0) {
                _timeToShowVitChange = 0;
            }
        }
        if (_timeToShowEthChange > 0) {
            _timeToShowEthChange -= dt;
            if (_timeToShowEthChange < 0) {
                _timeToShowEthChange = 0;
            }
        }
    }

    void ClientEntity::draw(gltext::FontRendererPtr rend) const {
        getClientAppearance()->draw();

        // Draw the loss/gain of vitality/ether above the character if needs be.
        if (_timeToShowVitChange > 0 && _vitalityChange != 0) {
            glDisable(GL_TEXTURE_2D);
            glEnable(GL_BLEND);
            glPushMatrix();
            glTranslatef(-0.1f,getBounds().getHeight()+0.5f,0);
            glScalef(0.02f,-0.02f,0.02f);
            if (_vitalityChange < 0) {
                glColor3f(1.0f,0.0f,0.0f);
            }
            else {
                glColor3f(0.0f,1.0f,0.0f);
            }
            GLTEXT_STREAM(rend) << abs(_vitalityChange);
            glPopMatrix();
            glEnable(GL_TEXTURE_2D);
        }
        if (_timeToShowEthChange > 0 && _etherChange != 0) {
            glDisable(GL_TEXTURE_2D);
            glEnable(GL_BLEND);
            glPushMatrix();
            glTranslatef(-0.1f,getBounds().getHeight()+0.5f,0);
            glScalef(0.02f,-0.02f,0.02f);
            if (_etherChange < 0) {
                glColor3f(0.0f,0.0f,1.0f);
            }
            else {
                glColor3f(1.0f,1.0f,1.0f);
            }
            GLTEXT_STREAM(rend) << abs(_etherChange);
            glPopMatrix();
            glEnable(GL_TEXTURE_2D);
        }
            

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

    void ClientEntity::setCurrentVitality(int val) {
        // Do not set change if it is the first time vitality has been set
        if (_vitalityFirstTime) {
            _vitalityFirstTime = false;
        }
        else {
            _vitalityChange = val - _currentVitality;
            _timeToShowVitChange = 1.0f;
        }
        _currentVitality = val; 
        
    }

    void ClientEntity::setCurrentEther(int val) {
        if (_etherFirstTime) {
            _etherFirstTime = false;
        }
        else {
            _etherChange = val - _currentEther;
            _timeToShowEthChange = 1.0f;
        }
        _currentEther = val; 
        
    }
}
