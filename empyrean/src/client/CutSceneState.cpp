#include "CutSceneState.h"
#include "GameState.h"
#include "GLUtility.h"
#include "Texture.h"


namespace pyr {

    CutSceneState::CutSceneState() {
        static const std::string images[] = {
            "warrior1.jpg",
            "Caphriel3.jpg",
            "ninja1.jpg",
            "Robot3.jpg",
            "levelOneColor.jpg",
        };

        for (size_t i = 0; i < sizeof(images) / sizeof(*images); ++i) {
            Texture* texture = Texture::create("cutscene/" + images[i]);
            _images.push_back(texture);
        }

    }

    void CutSceneState::update(float dt) {
        _fade = std::min(1.0f, _fade + dt);
    }

    void CutSceneState::draw(float fade) {
        setOrthoProjection(1, 1);

        glDisable(GL_DEPTH_TEST);
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        if (_current <= _images.size()) {
            glColor4f(1, 1, 1, 1);
            if (_current > 0) {
                _images[_current - 1]->drawRectangle(0, 0, 1, 1);
            } else {
                glClear(GL_COLOR_BUFFER_BIT);
            }
            glColor4f(1, 1, 1, _fade);
            _images[_current]->drawRectangle(0, 0, 1, 1);
        }
    }

    void CutSceneState::onKeyPress(SDLKey key, bool down) {
        if (key == SDLK_ESCAPE) {
            invokeTransition<GameState>();
            return;
        }
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
        _fade = 0;
        if (++_current >= _images.size()) {
            invokeTransition<GameState>();
        }
    }

}
