#include <stdexcept>
#include <gmtl/gmtl.h>

#include "GameEntity.h"
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
#include "HUD.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("GameState::GameState");
        
        _inputLeft   = &_im.getInput("Left");
        _inputRight  = &_im.getInput("Right");
        _inputJump   = &_im.getInput("Space");
        _inputAttack = &_im.getInput("RCtrl");
        _inputQuit   = &_im.getInput("Escape");
        _inputJoyX   = &_im.getInput("JoyX");
        _inputJoyJump = &_im.getInput("JoyJump");
        _inputJoyStart = &_im.getInput("JoyStart");
        _input1 = &_im.getInput("1");
        _input2 = &_im.getInput("2");
        _input3 = &_im.getInput("3");
        _input4 = &_im.getInput("4");
        _inputJoyAttack = &_im.getInput("JoyAttack");
        _inputJoyX->setValue(0);

        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 16);
        _renderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!_renderer) {
            throw std::runtime_error("Error opening fonts/Vera.ttf");
        }
    }

    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("GameState::draw");
        
        Scene& scene = the<Scene>();
        scene.draw();

        if (GameEntity* entity = dynamic_cast<GameEntity*>(scene.getFocus())) {
            the<HUD>().draw(_renderer, entity);

            if (_showPlayerData) {
                Application& app = the<Application>();
                glEnable(GL_BLEND);
                setOrthoProjection(float(app.getWidth()), float(app.getHeight()));
                glPushMatrix();
                glTranslatef(app.getWidth() / 2.0f, 0, 0);
                glColor3f(1, 1, 1);
                GLTEXT_STREAM(_renderer)
                    << "Position: " << entity->getPos() << "\n"
                    << "Velocity: " << entity->getVel() << "\n"
                    << "Jumping: " << entity->getJumping();
                glPopMatrix();
            }
        }
    }

    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("GameState::update");
        
        the<Scene>().update(dt);

        ServerConnection& sc = the<ServerConnection>();
        sc.update();

        // Effect the player's vitality
        GameEntity* gent = dynamic_cast<GameEntity*>(the<Scene>().getFocus());
        if (gent) {
            if (_input1->getValue() == 1) {
                gent->decrVitality(2);
            }
            if (_input2->getValue() == 1) {
                gent->incrVitality(2);
            }
            if (_input3->getValue() == 1) {
                gent->decrEther(1);
            }
            if (_input4->getValue() == 1) {
                gent->incrEther(1);
            }
        }

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
           Entity* entity = the<Scene>().getFocus();

            if(entity) {
                if(entity->jump()) {
                    sc.sendEvent(PE_JUMP);
                }
            }
        }
        
        // attack!
        if (_inputAttack->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_ATTACK);
        }

        // Input with Joystick
        if(_inputJoyX->getValue() > 0.5 && _lastJoyX == 0) {
            sc.sendEvent(PE_BEGIN_RIGHT);
            _lastJoyX = 1;
        }
        else if(fabs(_inputJoyX->getValue()) < 0.5 && _lastJoyX > 0.5) {
            sc.sendEvent(PE_END_RIGHT);
            _lastJoyX = 0;
        }
        else if(fabs(_inputJoyX->getValue()) < 0.5 && _lastJoyX < -0.5) {
            sc.sendEvent(PE_END_LEFT);
            _lastJoyX = 0;
        }
        else if(_inputJoyX->getValue() < -0.5 && _lastJoyX == 0) {
            sc.sendEvent(PE_BEGIN_LEFT);
            _lastJoyX = -1;
        }
        else if(_inputJoyX->getValue() < -0.5 && _lastJoyX > 0.5) {
            sc.sendEvent(PE_END_RIGHT);
            sc.sendEvent(PE_BEGIN_LEFT);
            _lastJoyX = -1;
        }
        else if(_inputJoyX->getValue() > 0.5 && _lastJoyX < -0.5) {
            sc.sendEvent(PE_END_LEFT);
            sc.sendEvent(PE_BEGIN_RIGHT);
            _lastJoyX = 1;
        }
       
        // jump!
        if (_inputJoyJump->getDelta() > gmtl::GMTL_EPSILON) {
            Entity* entity = the<Scene>().getFocus();
            if(entity) {
                if(entity->jump()) {
                    sc.sendEvent(PE_JUMP);
                }
            }
        }
        
        // attack!
        if (_inputJoyAttack->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent(PE_ATTACK);
        }

        // Start
        if(_inputJoyStart->getDelta() > gmtl::GMTL_EPSILON) {
            sc.disconnect();
            invokeTransition<MenuState>();
        }

        // Quit
        if (_inputQuit->getValue() >= 0.50f) {
            sc.disconnect();
            invokeTransition<MenuState>();
        }

        _im.update(dt);
    }
    
    void GameState::onKeyPress(SDLKey key, bool down) {
        if (key == SDLK_F2 && down) {
            _showPlayerData = !_showPlayerData;
        }

        _im.onKeyPress(key, down);
    }
    
    void GameState::onMousePress(Uint8 button, bool down, int x, int y) {
        _im.onMousePress(button, down, x, y);
    }
    
    void GameState::onMouseMove(int x, int y) {
        _im.onMouseMove(x, y);
    }

    void GameState::onJoyPress(Uint8 button, bool down) {
        _im.onJoyPress(button,down);
    }

    void GameState::onJoyMove(int axis, float value) {
        _im.onJoyMove(axis,value);
    }


}
