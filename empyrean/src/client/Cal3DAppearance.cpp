#include "Cal3DAppearance.h"
#include "Renderer.h"


namespace pyr {

    Cal3DAppearance::Cal3DAppearance(const std::string& resource) {
        _resource = resource;
        _model = new Model(_resource);
    }

    void Cal3DAppearance::sendCommand(const std::string& command) {
    }

    void Cal3DAppearance::beginAnimation(const std::string& animation) {
    }

    void Cal3DAppearance::beginAnimationCycle(const std::string& animation) {
    }

    void Cal3DAppearance::update(float dt) {
        _model->update(dt);
    }

    void Cal3DAppearance::draw() {

        // Render player model.
        glPushMatrix();
        glEnable(GL_DEPTH_TEST);
        //glRotatef(_direction + 180, 0, 1, 0);
        glRotatef(90, 1, 0, 0);
        glScalef(1, 1, -1);
        DefaultRenderer().draw(_model.get());
        glDisable(GL_DEPTH_TEST);
        glPopMatrix();
    }

}
