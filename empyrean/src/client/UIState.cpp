#include <phui/SDLBridge.h>
#include "UIState.h"


namespace pyr {

    UIState::UIState() {
        _root = new phui::RootWidget(1024, 768);
    }
    
    void UIState::update(float dt) {
        PYR_PROFILE_BLOCK("UIState::update");
        _root->update(dt);
    }
    
    void UIState::draw() {
        PYR_PROFILE_BLOCK("UIState::draw");

        // New renderer is needed!
        glDisable(GL_DEPTH_TEST);
        
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

        glDisable(GL_TEXTURE_2D);
        _root->draw();

        glEnable(GL_TEXTURE_2D);
    }

    void UIState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            _root->genKeyDownEvent(phui::SDLToPhuiKey(key));
        } else {
            _root->genKeyUpEvent(phui::SDLToPhuiKey(key));
        }
    }

    void UIState::onMousePress(Uint8 button, bool down, int x, int y) {
        const phui::Point p(
            x * 1024 / Application::instance().getWidth(),
            y * 768 / Application::instance().getHeight());
        if (down) {
            _root->genMouseDownEvent(phui::SDLToPhuiButton(button), p);
        } else {
            _root->genMouseUpEvent(phui::SDLToPhuiButton(button), p);
        }
        _joyVelX = 0;
        _joyVelY = 0;
    }

    void UIState::onMouseMove(int x, int y) {
        const phui::Point p(
            x * 1024 / Application::instance().getWidth(),
            y * 768 / Application::instance().getHeight());
        _root->genMouseMoveEvent(p);
        _joyVelX = 0;
        _joyVelY = 0;
    }

    void UIState::onJoyPress(Uint8 button, bool down) {
        if(button == 8 && down) {
            quit();
        }

        const phui::Point p(
            Application::instance().getMousePosX() * 1024 / Application::instance().getWidth(),
            Application::instance().getMousePosY() * 768 / Application::instance().getHeight());

        if (button == 0 && down) {
            _root->genMouseDownEvent(phui::SDLToPhuiButton(SDL_BUTTON_LEFT), p);
        } else if(button == 0) {
            _root->genMouseUpEvent(phui::SDLToPhuiButton(SDL_BUTTON_LEFT), p);
        }

        if (button == 1 && down) {
            _root->genMouseDownEvent(phui::SDLToPhuiButton(SDL_BUTTON_RIGHT), p);
        } else if(button == 1) {
            _root->genMouseUpEvent(phui::SDLToPhuiButton(SDL_BUTTON_RIGHT), p);
        }


    }

    void UIState::onJoyMove(int axis, float value) {
        if(axis == 0) {
            if(fabs(value) > 0.25f) {
                _joyVelX = static_cast<int>(value / 0.001f);
            }
            else {
                _joyVelX = 0;
            }

        } else if(axis == 1) {
            if(fabs(value) > 0.25f) {
                _joyVelY = static_cast<int>(value / 0.001f);
            }
            else {
                _joyVelY = 0;
            }
        }

        the<Application>().setMouseVelX(_joyVelX);
        the<Application>().setMouseVelY(_joyVelY);
    }

}
