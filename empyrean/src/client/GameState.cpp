#include <SDL_opengl.h>
#include "GameState.h"
#include "Input.h"
#include "InputManager.h"


namespace pyr {

    GameState::GameState() {
        _inputX     = &_im.getInput("MouseX");
        _inputY     = &_im.getInput("MouseY");
        _inputLeft  = &_im.getInput("MouseLeft");
        _inputRight = &_im.getInput("MouseRight");
        _rotation = 0;
    }
    
    void GameState::draw() {
        glClear(GL_COLOR_BUFFER_BIT);
        
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 4, 3, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        float x = _inputX->getValue() * 4;
        float y = _inputY->getValue() * 3;
        
        glTranslatef(x, y, 0);
        glRotatef(_rotation, 0, 0, 1);
        
        glBegin(GL_QUADS);
        glColor3f(1, 0, 0); glVertex2f(-0.5f, -0.5f);
        glColor3f(0, 1, 0); glVertex2f(-0.5f,  0.5f);
        glColor3f(0, 0, 1); glVertex2f( 0.5f,  0.5f);
        glColor3f(1, 0, 1); glVertex2f( 0.5f, -0.5f);
        glEnd();
    }
    
    void GameState::update(float dt) {
        _im.update(dt);
        _rotation += _inputLeft->getValue()  * dt * 50;
        _rotation -= _inputRight->getValue() * dt * 50;
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
