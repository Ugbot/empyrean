#include <stdlib.h>
#include "Application.h"
#include "IntroState.h"


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
    }
    
    void Application::resize(int width, int height) {
        _width  = width;
        _height = height;
    }
    
    void Application::draw() {
        if (_currentState) {
            _currentState->draw();
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
    }
    
    void Application::onKeyPress(SDLKey key, bool down) {
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
        _nextState = state;
    }
    
    bool Application::shouldQuit() {
        return !bool(_currentState);
    }

}
