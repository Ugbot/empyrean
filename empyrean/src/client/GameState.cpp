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
#include "Scene.h"
#include "ServerConnection.h"
#include "Texture.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("GameState::GameState");
        
        _inputMLeft  = &_im.getInput("MouseLeft");
        _inputMRight = &_im.getInput("MouseRight");
        _inputLeft   = &_im.getInput("Left");
        _inputRight  = &_im.getInput("Right");
        _inputSpace  = &_im.getInput("Space");
        _inputQuit   = &_im.getInput("Escape");

        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 16);
        _renderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!_renderer) {
            throw std::runtime_error("Error opening fonts/Vera.ttf");
        }

        _player = new PlayerEntity(
            new Model("models/paladin/paladin.cfg"),
            new DefaultRenderer());
        Scene::instance().addEntity(0, _player);

//        ServerConnection& sc = ServerConnection::instance();
//        sc.connect("localhost", 8765, &_scene);
//        sc.login("aegis", "wazaa");
    }

    GameState::~GameState() {
//        ServerConnection::instance().disconnect();
    }

    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("GameState::draw");
        Scene::instance().draw();
        
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        gluOrtho2D(0, 400, 300, 0);
        
        glEnable(GL_TEXTURE_2D);
        glEnable(GL_BLEND);
        glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
        glColor4f(1, 1, 1, 1);
        glTranslatef(0, 8, 0);
        bool loggedIn = ServerConnection::instance().isLoggedIn();
        GLTEXT_STREAM(_renderer) << (loggedIn ? "Logged In" : "Not Logged In");
    }

    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("GameState::update");
        
        _im.update(dt);
        Scene::instance().update(dt);

//        ServerConnection& sc = ServerConnection::instance();
//        sc.update();
//        sc.setForce(_inputRight->getValue() - _inputLeft->getValue());

        float dx = _inputRight->getValue() - _inputLeft->getValue();
        float dy = 1 - _inputSpace->getValue() * 2;
        _player->setVel(gmtl::Vec2f(dx * 50, dy * 10));

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
