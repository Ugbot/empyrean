#include "CutSceneState.h"
#include "GameState.h"
#include "GLUtility.h"
#include "Texture.h"


namespace pyr {

    CutSceneState::CutSceneState() {
        static const std::string images[] = {
            "ANOTHERGUESTSTRIPBYANDY.jpg",
            "comic12.jpg",
            "comic18.jpg",
            "comic7.jpg",
            "comic8.jpg",
            "GUESTSTRIPBYTHRASHER.jpg",
        };

        for (size_t i = 0; i < sizeof(images) / sizeof(*images); ++i) {
            Texture* texture = Texture::create("cutscene/" + images[i]);
            _images.push_back(texture);
        }
        
    }

    void CutSceneState::update(float dt) {
    }

    void CutSceneState::draw(float fade) {
        setOrthoProjection(1, 1);

        glDisable(GL_DEPTH_TEST);
        glEnable(GL_TEXTURE_2D);
        glColor3f(1, 1, 1);

        if (_current <= _images.size()) {
            _images[_current]->drawRectangle(0, 0, 1, 1);
        }
    }

    void CutSceneState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            next();
        }
    }

    void CutSceneState::onMousePress(Uint8 button, bool down, int x, int y) {
        if (down) {
            next();
        }
    }

    void CutSceneState::onJoyPress(Uint8 button, bool down) {
        if (down) {
            next();
        }
    }

    void CutSceneState::next() {
        if (++_current >= _images.size()) {
            invokeTransition<GameState>();
        }
    }

}
