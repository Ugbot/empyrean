#include <stdlib.h>
#include "Application.h"
#include "GameState.h"


namespace pyr {

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
        _currentState = new GameState();
    }
    
    Application::~Application() {
        delete _currentState;
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
    }
    
    bool Application::shouldQuit() {
        return (_currentState == 0);
    }

}
