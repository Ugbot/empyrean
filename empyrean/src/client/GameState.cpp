
#include <SDL_opengl.h>

#include "GameState.h"
#include "Input.h"
#include "InputManager.h"
#include "MenuState.h"
#include "Profiler.h"
#include "Model.h"
#include "Renderer.h"
#include "Entity.h"
#include "PlayerEntity.h"
#include "ParticleSystem.h"
#include "Texture.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("Init");
        _inputX     = &_im.getInput("MouseX");
        _inputY     = &_im.getInput("MouseY");
        _inputLeft  = &_im.getInput("MouseLeft");
        _inputRight = &_im.getInput("MouseRight");
        _inputQuit  = &_im.getInput("Escape");
        _rotation = 0;

        _renderer = new CellShadeRenderer;
        _renderer->useVertexArrays(false);
        _testModel = Model::create("models/paladin/paladin.cfg");

        _backdropTex = Texture::create("images/backdrop.jpg");

        Entity* player = new PlayerEntity(_testModel, _renderer, &_im);
        player->setPos( gmtl::Vec2f(200,290) );

        _particles = new ParticleSystem;
        _particles->setColor(Color(1,1,1,1));
        _particles->setGravity(gmtl::Vec2f(0,10));
        _particles->fadeToColor(Color(0,0,1,1),30);

        _entities.push_back(player);
        _entities.push_back(_particles);
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
            _particles->setPos(gmtl::Vec2f(x,y));
        }

        /*
        glDisable(GL_TEXTURE_2D);
        glPushMatrix();
            float x = _inputX->getValue() * 400;
            float y = _inputY->getValue() * 300;
            glTranslatef(x, y, 0);
            
            glRotatef(_rotation, 0, 0, 1);
            
            float scale = fade * 1000 + 100;
            glScalef(scale, scale, scale);
            
            glBegin(GL_QUADS);
            glColor3f(1, 0, 0); glVertex2f(-0.5f, -0.5f);
            glColor3f(0, 1, 0); glVertex2f(-0.5f,  0.5f);
            glColor3f(0, 0, 1); glVertex2f( 0.5f,  0.5f);
            glColor3f(1, 0, 1); glVertex2f( 0.5f, -0.5f);
            glEnd();
        glPopMatrix();
        */
        
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
        _rotation += _inputLeft->getValue()  * dt * 50;
        _rotation -= _inputRight->getValue() * dt * 50;
        
        if (_inputQuit->getValue() >= 0.50f) {
            invokeTimedTransition<MenuState>(1);
        }

        for (unsigned int i = 0; i < _entities.size(); i++) {
            _entities[i]->update(dt);
        }

        //_testModel->update(dt);
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
