#include "MapRenderer.h"
#include "OBJAppearance.h"
#include "OBJLoader.h"
#include "OpenGL.h"


namespace pyr {

    OBJAppearance::OBJAppearance(const string& resource) {
        _resource = resource;
        _model = loadOBJFile(resource);
    }

    void OBJAppearance::sendCommand(const std::string& command) {
    }

    void OBJAppearance::beginAnimation(const std::string& animation) {
    }

    void OBJAppearance::beginAnimationCycle(const std::string& animation) {
    }

    void OBJAppearance::update(float dt) {
        _time += dt;
    }

    void OBJAppearance::draw() {
        glEnable(GL_DEPTH_TEST);

        glPushMatrix();
// IGF HACK
        glRotatef(-90, 0, 1, 0);
        //glRotatef(_time * 43 / 200, 1, 0, 0);
        //glRotatef(_time * 47 / 200, 0, 1, 0);
        //glRotatef(_time * 53 / 200, 0, 0, 1);

        MapRenderer m;
        _model->handleVisitor(m);

        glPopMatrix();
    }

}
