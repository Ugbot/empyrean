#include <SDL_opengl.h>
#include "GameState.h"
#include "Input.h"
#include "InputManager.h"


namespace pyr {

    GameState::GameState() {
        InputManager& im = InputManager::instance();
        _inputX     = &im.getInput("MouseX");
        _inputY     = &im.getInput("MouseY");
        _inputLeft  = &im.getInput("MouseLeft");
        _inputRight = &im.getInput("MouseRight");
        _rotation = 0;
    }
    
    GameState::~GameState() {
    }
    
    void GameState::draw() {
        glClear(GL_COLOR_BUFFER_BIT);
        
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();
        gluOrtho2D(0, 1, 1, 0);
        
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();
        
        float x = _inputX->getValue();
        float y = _inputY->getValue();
        
        glTranslatef(x, y, 0);
        glRotatef(_rotation, 0, 0, 1);
        
        glBegin(GL_TRIANGLES);
        glColor3f(1, 0, 0);
        glVertex2f(0, -0.5f);
        glColor3f(0, 1, 0);
        glVertex2f(-0.5f, 0.25f);
        glColor3f(0, 0, 1);
        glVertex2f(0.5f, 0.25f);
        glEnd();
    }
    
    void GameState::update(float dt) {
        _rotation += _inputLeft->getValue()  * dt * 50;
        _rotation -= _inputRight->getValue() * dt * 50;
    }

}
