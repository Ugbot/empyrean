#include <stdexcept>
#include "AppearanceFactory.h"
#include "Application.h"
#include "AudioSystem.h"
#include "Constants.h"
#include "GameState.h"
#include "GLUtility.h"
#include "Input.h"
#include "InputManager.h"
#include "LobbyState.h"
#include "Model.h"
#include "ModelRenderer.h"
#include "PacketTypes.h"
#include "ParticleSystem.h"
#include "ParticleEmitter.h"
#include "Profiler.h"
#include "Scene.h"
#include "ServerConnection.h"
#include "Texture.h"
#include "HUD.h"
//#include "VisDebug.h"

namespace pyr {

    namespace {

        Logger& _logger = Logger::get("pyr.State.GameState");

    }

    GameState::GameState() {
        PYR_PROFILE_BLOCK("GameState::GameState");

        definePacketHandler(this, &GameState::handleSetMap);
        definePacketHandler(this, &GameState::handleSetPlayer);
        definePacketHandler(this, &GameState::handleEntityAdded);
        definePacketHandler(this, &GameState::handleEntityRemoved);
        definePacketHandler(this, &GameState::handleEntityUpdated);
        definePacketHandler(this, &GameState::handleAppearance);
        definePacketHandler(this, &GameState::handleCharacterUpdate);
        the<ServerConnection>().addReceiver(this);

        _inputLeft   = &_im.getInput("Left");
        _inputRight  = &_im.getInput("Right");
        _inputJump   = &_im.getInput("Space");
        _inputAttack = &_im.getInput("RCtrl");
        _inputQuit   = &_im.getInput("Escape");
        _inputAttackA = &_im.getInput("D");
        _inputAttackB = &_im.getInput("F");

        _inputJoyX   = &_im.getInput("JoyX");
        _inputJoyJump = &_im.getInput("JoyJump");
        _inputJoyStart = &_im.getInput("JoyStart");
        _inputJoyAttack = &_im.getInput("JoyAttack");
        _inputJoyX->setValue(0);

        _input1 = &_im.getInput("1");
        _input2 = &_im.getInput("2");
        _input3 = &_im.getInput("3");
        _input4 = &_im.getInput("4");

        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 16);
        _renderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!_renderer) {
            throw std::runtime_error("Error opening fonts/Vera.ttf");
        }

        //loadCombos(_combosLoaded);

        /*comboDef combo1;
        combo1.name = "Super";
        combo1.act.push_back("AttackA");
        combo1.act.push_back("AttackB");
        combo1.act.push_back("AttackA");

        comboDef combo2;
        combo2.name = "Double";
        combo2.act.push_back("AttackA");
        combo2.act.push_back("AttackA");

        comboDef combo3;
        combo3.name = "Mix Attack";
        combo3.act.push_back("AttackA");
        combo3.act.push_back("AttackB");

        fastComboDefs.push_back(combo1);
        fastComboDefs.push_back(combo2);
        _combosLoaded.push_back(combo3);*/

        the<ServerConnection>().sendPacket(new AllowUpdatesPacket());
        
        the<AudioSystem>().playMusic("music/forestMain.mp3");
    }

    GameState::~GameState() {

    }

    void GameState::draw() {
        PYR_PROFILE_BLOCK("GameState::draw");
        
        _scene.draw(_renderer);
        checkOpenGLErrors();

#if 0
        // Draw any lines and points in the visDebug
        std::vector<DebugRay> debugRays = the<VisDebug>().getSegs();
        glLineWidth(2.0);
        glBegin(GL_LINES);
        for (size_t i=0; i<debugRays.size(); ++i) {
            glColor3f(debugRays[i].color[0],debugRays[i].color[1],debugRays[i].color[2]);
            glVertex2f(debugRays[i].pt1[0],debugRays[i].pt1[1]);
            glVertex2f(debugRays[i].pt2[0],debugRays[i].pt2[1]);
        }
        glEnd();
        checkOpenGLErrors();

        the<VisDebug>().clearSegs();
        std::vector<Vec2f> debugPts = the<VisDebug>().getPts();
        glBegin(GL_POINTS);
        for (size_t i=0; i<debugPts.size(); ++i) {
            glColor3f(1,1,1);
            glVertex2f(debugPts[i][0],debugPts[i][1]);            
        }
        glEnd();
        the<VisDebug>().clearPts();
        checkOpenGLErrors();
#endif

        if (ClientEntityPtr entity = _scene.getFocus()) {
            _hud.draw(_renderer,entity);
            checkOpenGLErrors();

            if (_showPlayerData) {
                Application& app = the<Application>();
                glEnable(GL_BLEND);
                setOrthoProjection(float(app.getWidth()), float(app.getHeight()));
                glPushMatrix();
                glTranslatef(app.getWidth() / 2.0f, 0, 0);
                glColor3f(1, 1, 1);
                GLTEXT_STREAM(_renderer)
                    << "Position: " << entity->getPos() << "\n"
                    << "Velocity: " << entity->getVel();
                glPopMatrix();
            }
            checkOpenGLErrors();
        }

    }

    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("GameState::update");

        _scene.update(dt);
        _hud.update(dt);

        ServerConnection& sc = the<ServerConnection>();

        // Affect the player's vitality
        if (_input1->getValue() == 1) {
            sc.sendHUDUpdate(new TempHUDPacket(0,1,0,0));
        }
        if (_input2->getValue() == 1) {
            sc.sendHUDUpdate(new TempHUDPacket(1,0,0,0));
        }
        if (_input3->getValue() == 1) {
            sc.sendHUDUpdate(new TempHUDPacket(0,0,0,1));
        }
        if (_input4->getValue() == 1) {
            sc.sendHUDUpdate(new TempHUDPacket(0,0,1,0));
        }

        // Combined key/joy input needs to be implemented with an Input
        // that combines two others.
       
        // move to the right!
        if (_inputRight->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent("Begin Right");
        } else if (_inputRight->getDelta() < -gmtl::GMTL_EPSILON) {
            sc.sendEvent("End Right");
        }

        // move to the left!
        if (_inputLeft->getDelta() > gmtl::GMTL_EPSILON) {
            sc.sendEvent("Begin Left");
        } else if (_inputLeft->getDelta() < -gmtl::GMTL_EPSILON) {
            sc.sendEvent("End Left");
        }

        // Move with Joystick
        if(_inputJoyX->getValue() > 0.5 && _lastJoyX == 0) {
            sc.sendEvent("Begin Right");
            _lastJoyX = 1;
        }
        else if(fabs(_inputJoyX->getValue()) < 0.5 && _lastJoyX > 0.5) {
            sc.sendEvent("End Right");
            _lastJoyX = 0;
        }
        else if(fabs(_inputJoyX->getValue()) < 0.5 && _lastJoyX < -0.5) {
            sc.sendEvent("End Left");
            _lastJoyX = 0;
        }
        else if(_inputJoyX->getValue() < -0.5 && _lastJoyX == 0) {
            sc.sendEvent("Begin Left");
            _lastJoyX = -1;
        }
        else if(_inputJoyX->getValue() < -0.5 && _lastJoyX > 0.5) {
            sc.sendEvent("End Right");
            sc.sendEvent("Begin Left");
            _lastJoyX = -1;
        }
        else if(_inputJoyX->getValue() > 0.5 && _lastJoyX < -0.5) {
            sc.sendEvent("End Left");
            sc.sendEvent("Begin Right");
            _lastJoyX = 1;
        }

        // jump!
        if (_inputJump->getDelta() > gmtl::GMTL_EPSILON  || 
            _inputJoyJump->getDelta() > gmtl::GMTL_EPSILON) {
           
           sc.sendEvent("Jump");
        }

        // Start
        if(_inputJoyStart->getDelta() > gmtl::GMTL_EPSILON) {
            sc.disconnect();
            invokeTransition<LobbyState>();
        }

        // Quit
        if (_inputQuit->getValue() >= 0.50f) {
            sc.disconnect();
            invokeTransition<LobbyState>();
        }
        
        if(_inputAttack->getDelta() < -gmtl::GMTL_EPSILON) {
            the<AudioSystem>().playSound("sounds/attack.wav");
            sc.sendAttack("Attack");
        }

        // interpret attack and jump commands for combos
        //comboInterpreter(dt);

        _im.update(dt);
    }
    
    void GameState::handleSetMap(Connection*, SetMapPacket* p) {
        _scene.setMap(p->map());
    }

    void GameState::handleSetPlayer(Connection*, SetPlayerPacket* p) {
        _scene.setFocus(p->id());
    }

    void GameState::handleEntityAdded(Connection*, EntityAddedPacket* p) {
        ClientEntity* entity = new ClientEntity(
            instantiateBehavior(p->behavior(), p->behaviorResource()),
            instantiateAppearance(p->appearance(), p->appearanceResource()));
        // Hardcoded for now.  Hardcoded in the server as well.
        entity->setBounds(BoundingRectangle(p->boundsMin(), p->boundsMax()));
        _scene.addEntity(p->id(), entity);
    }

    void GameState::handleEntityRemoved(Connection*, EntityRemovedPacket* p) {
        EntityPtr entity = _scene.getEntity(p->id());
        if (entity) {
            _scene.removeEntity(p->id());
        } else {
            PYR_LOG(_logger, WARN, "Received remove entity packet for nonexistent entity " << p->id());
        }
    }

    void GameState::handleEntityUpdated(Connection*, EntityUpdatedPacket* p) {
        EntityPtr entity = _scene.getEntity(p->id());
        if (entity) {
            entity->setPos(p->pos());
            entity->setVel(p->vel());
        } else {
            PYR_LOG(_logger, WARN, "Received update entity packet for nonexistent entity " << p->id());
        }
    }

    void GameState::handleAppearance(Connection*, AppearancePacket* p) {
        EntityPtr entity = _scene.getEntity(p->id());
        if (entity) {
            switch (p->code()) {
                case AP_COMMAND:         entity->sendAppearanceCommand(p->str()); break;
                case AP_ANIMATION:       entity->beginAnimation(p->str()); break;
                case AP_ANIMATION_CYCLE: entity->beginAnimationCycle(p->str()); break;
                default:
                    PYR_LOG(_logger, WARN, "Unknown code in appearance packet:");
                    p->log();
                    break;
            }
        } else {
            PYR_LOG(_logger, WARN, "Received appearance packet for nonexistent entity " << p->id());
        }
    }

    void GameState::handleCharacterUpdate(Connection*, CharacterUpdatedPacket* p) {
        ClientEntityPtr entity = _scene.getEntity(p->id());
        if (entity) {
            entity->setCurrentVitality(p->currVit());
            entity->setMaxVitality(p->maxVit());
            entity->setCurrentEther(p->currEth());
            entity->setMaxEther(p->maxEth());
        } else {
            PYR_LOG(_logger, WARN, "Received update entity packet for nonexistent entity " << p->id());
        }
    }

    void GameState::comboInterpreter(float dt) {
        
        ServerConnection& sc = the<ServerConnection>();

        if(_fastComboVector.size() > 0) {
            _fastComboVector[0].timer += dt;
        }

        // attack!
        if (_inputAttack->getDelta() > gmtl::GMTL_EPSILON ||
            _inputJoyAttack->getDelta() > gmtl::GMTL_EPSILON) {
            _fastComboVector.push_back(comboEvent("AttackA"));
        }

        if (_inputAttackA->getDelta() > gmtl::GMTL_EPSILON) {
            _fastComboVector.push_back(comboEvent("AttackA"));
        }

        if (_inputAttackB->getDelta() > gmtl::GMTL_EPSILON) {
            _fastComboVector.push_back(comboEvent("AttackB"));
        }

        if(fastCombo.size() > 0 &&
            fastCombo[0].timer > constants::FAST_COMBO) {

            // Check combos here
            std::string combo = checkFastCombos();

            if(combo != "None") {
                sc.sendAttack(combo);
                PYR_LOG(_logger, INFO, combo << " Special Attack");
                fastCombo.clear();
                return;
            }
            // Now if no combos arrived send the commands
            for(size_t i = 0; i < fastCombo.size(); ++i) {
                the<AudioSystem>().playSound("sounds/attack.wav");
                sc.sendAttack("Attack");
            }
            fastCombo.clear();
        }
    }

    std::string GameState::checkFastCombos() {
        /*for(size_t i = 0; i < _combosLoaded.size(); ++i) {
            bool comboFound = false;
            
            if(_fastComboVector.size() == _combosLoaded[i].act.size()) {
                for(size_t j = 0; j < _fastComboVector.size(); ++j) {
                    if(_fastComboVector[j].type == _combosLoaded[i].act[j]) {
                        comboFound = true;
                    }
                    else {
                        comboFound = false;
                        break;
                    }
                }
            }
            
            if(comboFound) {
                return _combosLoaded[i].name;
            }
        }
        */
        return "None";

    }


    void GameState::onKeyPress(SDLKey key, bool down) {
        if (down) {
            switch (key) {
                case SDLK_F2:
                    _scene.toggleEntityData();
                    _showPlayerData = !_showPlayerData;
                    break;
                case SDLK_F3:
                    _scene.toggleWireframe();
                    break;
                case SDLK_F4:
                    _scene.toggleNormals();
                    break;
                case SDLK_F5:
                    _scene.toggleCollision();
                    break;
                case SDLK_F6:
                    _scene.toggleLighting();
                    break;
                default: // gcc is gay.
                    break;
            }
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
