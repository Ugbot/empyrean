#include <stdexcept>
#include <gmtl/gmtl.h>

#include "Entity.h"
#include "GameState.h"
#include "GLUtility.h"
#include "Input.h"
#include "InputManager.h"
#include "MenuState.h"
#include "Model.h"
#include "Renderer.h"
#include "PacketTypes.h"
#include "ParticleSystem.h"
#include "ParticleEmitter.h"
#include "Profiler.h"
#include "Scene.h"
#include "ServerConnection.h"
#include "Texture.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("GameState::GameState");
        
        _inputLeft   = &_im.getInput("Left");
        _inputRight  = &_im.getInput("Right");
        _inputJump   = &_im.getInput("Space");
        _inputAttack = &_im.getInput("RCtrl");
        _inputQuit   = &_im.getInput("Escape");

        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 16);
        _renderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!_renderer) {
            throw std::runtime_error("Error opening fonts/Vera.ttf");
        }
    }

    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("GameState::draw");
        
        Scene& scene = the<Scene>();
        Application& app = the<Application>();
        
        scene.draw();
        
        if (Entity* entity = scene.getFocus()) {
            glEnable(GL_BLEND);
            setOrthoProjection(float(app.getWidth()), float(app.getHeight()));
            glTranslatef(app.getWidth() / 2.0f, 0, 0);
            glColor3f(1, 1, 1);
            GLTEXT_STREAM(_renderer) << entity->getPos();
        }
    }

    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("GameState::update");
        
        the<Scene>().update(dt);

        ServerConnection& sc = the<ServerConnection>();
        sc.update();

        // move to the right!
        if (_inputRight->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_BEGIN_RIGHT);
        } else if (_inputRight->getDelta() < -gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_END_RIGHT);
        }
        
        // move to the left!
        if (_inputLeft->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_BEGIN_LEFT);
        } else if (_inputLeft->getDelta() < -gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_END_LEFT);
        }
        
        // jump!
        if (_inputJump->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_JUMP);
        }
        
        // attack!
        if (_inputAttack->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_ATTACK);
        }
        
        if (_inputQuit->getValue() >= 0.50f) {
            sc.disconnect();
            invokeTransition<MenuState>();
        }

        _im.update(dt);
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
