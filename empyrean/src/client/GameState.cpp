
#include <SDL_opengl.h>

#include "GameState.h"
#include "Input.h"
#include "InputManager.h"
#include "MenuState.h"
#include "Profiler.h"
#include "Model.h"
#include "Renderer.h"

namespace pyr {

    GameState::GameState() {
        PYR_PROFILE_BLOCK("Init");
        _inputX     = &_im.getInput("MouseX");
        _inputY     = &_im.getInput("MouseY");
        _inputLeft  = &_im.getInput("MouseLeft");
        _inputRight = &_im.getInput("MouseRight");
        _inputQuit  = &_im.getInput("Escape");
        _rotation = 0;

        _renderer=new DefaultRenderer;
        _testModel=Model::create("paladin/paladin.cfg");
    }
    
    void GameState::draw(float fade) {
        PYR_PROFILE_BLOCK("Render");

        _renderer->draw(*_testModel); // note to self: make draw accept a Model* so this looks nicer, as there won't be many (if any at all) models that aren't pointers.

        glDisable(GL_TEXTURE_2D);
        glDisable(GL_BLEND);
        
        glClearColor(0, 0, 0, 0);
        glClear(GL_COLOR_BUFFER_BIT);
        
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 4, 3, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        glPushMatrix();
            float x = _inputX->getValue() * 4;
            float y = _inputY->getValue() * 3;
            glTranslatef(x, y, 0);
            
            glRotatef(_rotation, 0, 0, 1);
            
            float scale = fade * 10 + 1;
            glScalef(scale, scale, scale);
            
            glBegin(GL_QUADS);
            glColor3f(1, 0, 0); glVertex2f(-0.5f, -0.5f);
            glColor3f(0, 1, 0); glVertex2f(-0.5f,  0.5f);
            glColor3f(0, 0, 1); glVertex2f( 0.5f,  0.5f);
            glColor3f(1, 0, 1); glVertex2f( 0.5f, -0.5f);
            glEnd();

        glPopMatrix();
        
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
