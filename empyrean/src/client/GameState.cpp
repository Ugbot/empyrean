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
        PYR_PROFILE_BLOCK("Init");
        
        _inputX     = &_im.getInput("MouseX");
        _inputY     = &_im.getInput("MouseY");
        _inputLeft  = &_im.getInput("MouseLeft");
        _inputRight = &_im.getInput("MouseRight");
        _inputQuit  = &_im.getInput("Escape");

        _renderer = new CellShadeRenderer;
        _renderer->useVertexArrays(true);
        _testModel = new Model("models/Paladin/Paladin.cfg");

        _backdropTex = Texture::create("images/backdrop.jpg");

        Entity* player = new PlayerEntity(_testModel.get(), _renderer, &_im);
        player->setPos( gmtl::Vec2f(200,290) );

        _particles = new ParticleSystem;
        _emitter = new ParticleEmitter(_particles);
        _emitter->setAccel(gmtl::Vec2f(0, 5));
        _emitter->setColor(Color(1, 1, 1, 1));
        _emitter->fadeToColor(Color(0, 0, 1, 1),15);
        _emitter->setPeriod(0.01f); // 100 particles/second
        _count=15;

        _entities.push_back(player);
        _entities.push_back(_particles);
        _entities.push_back(_emitter);
        
        //ServerConnection::instance().connectToServer("localhost");
    }

    GameState::~GameState() {
        while (_entities.size()>0) {
            Entity* ent=_entities.back();
            _entities.pop_back();
            delete ent;
        }
    }
    
    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("Render");

        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        glOrtho(0, 400, 300, 0, -100, 100);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

        Renderer::begin2D();
        glEnable(GL_TEXTURE_2D);
        glDisable(GL_BLEND);

        glClear(GL_DEPTH_BUFFER_BIT);
        _backdropTex->drawRectangle(0, 0, 400, 300);

        {
            float x = _inputX->getValue() * 400;
            float y = _inputY->getValue() * 300;
            _emitter->setPos(gmtl::Vec2f(x,y));
        }

        for (unsigned i = 0; i < _entities.size(); ++i) {
            glPushMatrix();
            glTranslate(_entities[i]->getPos());
            _entities[i]->draw();
            glPopMatrix();
        }
    }
        
    void GameState::update(float dt) {
        PYR_PROFILE_BLOCK("update");
        _im.update(dt);

        if (_inputLeft->getValue()==0)
            _emitter->setPeriod(0);
        else
            _emitter->setPeriod(0.01f);

        _count-=dt;
        if (_count < 0)
        {
            Color c;
            int idx = rand() & 7;
            switch (idx) {
                case 0: c=Color(0,1,0,1);   break;
                case 1: c=Color(1,0,0,1);   break;
                case 2: c=Color(0,0,1,1);   break;
                case 4: c=Color(1,1,0,1);   break;
                case 5: c=Color(1,0,1,1);   break;
                case 6: c=Color(0,1,1,1);   break;
                case 7: c=Color(1,1,1,1);   break;
            }
            _count = 15;
            _emitter->fadeToColor(c,15);
        }

        if (_inputQuit->getValue() >= 0.50f) {
            invokeTransition<MenuState>();
        }

        for (unsigned int i = 0; i < _entities.size(); i++) {
            _entities[i]->update(dt);
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
