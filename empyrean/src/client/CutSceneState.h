#ifndef PYR_CUT_SCENE_STATE_H
#define PYR_CUT_SCENE_STATE_H


#include "CutScene.h"
#include "State.h"


namespace pyr {

    class Texture;

    class CutSceneState : public State {
    public:
        CutSceneState();

        void update(float dt);
        void draw(float fade);

        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onJoyPress(Uint8 button, bool down);

    private:
        void next();

        CutScenePtr _cutScene;
        Zeroed<size_t> _current;
        Zeroed<float> _fade;
    };

}


#endif
