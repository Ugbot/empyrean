#include <stdlib.h>
#include <sstream>

#include "Application.h"
#include "Font.h"
#include "IntroState.h"
#include "NSPRUtility.h"
#include "OpenGL.h"
#include "Profiler.h"
#include "Texture.h"

namespace pyr {

    typedef IntroState InitialState;


    Application* Application::_instance = 0;

    Application& Application::instance() {
        if (!_instance) {
            _instance = new Application();
            atexit(destroy);
        }
        return *_instance;
    }
    
    void Application::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    Application::Application() {
        _width  = 0;
        _height = 0;
        _lastX = 0;
        _lastY = 0;
        _currentState = new InitialState();
        _showCPUInfo = false;
        
        _totalFadeTime = 0;
        _currentFadeTime = 0;

        _font = new Font("fonts/Vera.ttf", 24);
        _font->setScale(1);
        
        _pointer = Texture::create("images/pointer.png");
    }
    
    void Application::resize(int width, int height) {
        _width  = width;
        _height = height;
    }
    
    void Application::draw() {
        PYR_PROFILE_BLOCK("Application::draw");
    
        if (_currentState) {
            _currentState->draw(0);
            
            if (_currentState->isPointerVisible()) {
                glMatrixMode(GL_PROJECTION);
                glLoadIdentity();
                glOrtho(0, _width, _height, 0, -1, 1);

                glMatrixMode(GL_MODELVIEW);
                glLoadIdentity();
                
                glColor4f(1, 1, 1, 1);
                _pointer->drawRectangle(float(_lastX), float(_lastY));
            }
        }
        if (_fadingState && _totalFadeTime != 0) {
            _fadingState->draw(_currentFadeTime / _totalFadeTime);
        }

        if (_showCPUInfo) {
            PYR_PROFILE_BLOCK("Render");

            const Profiler::ProcessMap& pi = Profiler::getProfileInfo();
            float totaltime = Profiler::getTotalTime();

            glMatrixMode(GL_PROJECTION);
            glLoadIdentity();
            glOrtho(0, 1024, 768, 0, -1, 1);
            
            glMatrixMode(GL_MODELVIEW);
            glLoadIdentity();
            glTranslatef(0,24,0);
            
            glEnable(GL_TEXTURE_2D);
	    glEnable(GL_BLEND);
	    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	    glColor4f(1, 1, 1, 1);
            (*_font) << "FPS: " << _fps.getFPS() << "\n";

            for (Profiler::ProcessMap::const_iterator iter = pi.begin(); iter != pi.end(); iter++) {
                glTranslatef(0,24,0);
                int i = int(iter->second.time / totaltime * 100);
                (*_font) << iter->first << ": " << i << "%\n";
            }
        }
    }
    
    void Application::update(float dt) {
        if (_currentState) {
            _currentState->update(dt);
        }
        if (_nextState) {
            _currentState = _nextState;
            _currentState->onMouseMove(_lastX, _lastY);
        }
        if (_fadingState) {
            _currentFadeTime += dt;
            if (_currentFadeTime > _totalFadeTime) {
                _fadingState = 0;
                _totalFadeTime = 0;
                _currentFadeTime = 0;
            }
        }

        _fps.update(dt);
    }
    
    void Application::onKeyPress(SDLKey key, bool down) {
        if (down && key == SDLK_F1) {
            _showCPUInfo = !_showCPUInfo;
            return;
        }

        if (_currentState) {
            _currentState->onKeyPress(key, down);
        }
    }
    
    void Application::onMousePress(Uint8 button, bool down, int x, int y) {
        if (_currentState) {
            _currentState->onMousePress(button, down, x, y);
        }
    }
    
    void Application::onMouseMove(int x, int y) { 
        if (_currentState) {
            _currentState->onMouseMove(x, y);
        }
        _lastX = x;
        _lastY = y;
    }
    
    void Application::invokeTransition(State* state) {
        invokeTimedTransition(state, 0);
    }
    
    void Application::invokeTimedTransition(State* state, float seconds) {
        _nextState = state;
        _fadingState = _currentState;
        _totalFadeTime = seconds;
        _currentFadeTime = 0;
    }
    
    bool Application::shouldQuit() {
        return (_currentState == 0);
    }

}
