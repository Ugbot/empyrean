#include <gmtl/VecOps.h>

#include "Entity.h"
#include "GameState.h"
#include "GLUtility.h"
#include "Input.h"
#include "InputManager.h"
#include "MenuState.h"
#include "Model.h"
#include "Renderer.h"
#include "ParticleSystem.h"
#include "ParticleEmitter.h"
#include "Profiler.h"
#include "PlayerEntity.h"
#include "ServerConnection.h"
#include "Texture.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("GameState::GameState()");
        
        _inputX     = &_im.getInput("MouseX");
        _inputY     = &_im.getInput("MouseY");
        _inputLeft  = &_im.getInput("MouseLeft");
        _inputRight = &_im.getInput("MouseRight");
        _inputQuit  = &_im.getInput("Escape");

        ServerConnection::instance().connect("localhost", 8765, &_scene);
    }

    GameState::~GameState() {
        ServerConnection::instance().disconnect();
    }
    
    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("GameState::draw");
        _scene.draw();
    }
        
    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("GameState::update");
        _im.update(dt);
        _scene.update(dt);

        if (_inputQuit->getValue() >= 0.50f) {
            invokeTransition<MenuState>();
        }
    }
    
    void GameState::onKeyPress(SDLKey key, bool down) {
        _im.onKeyPress(key, down);
    }
    
    void GameState::onMousePress(Uint8 button, bool down, int x, int y) {
        _im.onMousePress(button, down, x, y);
    }
    
    void GameState::onMouseMove(int x, int y) {
        _im.onMouseMove(x, y);
    }

}
