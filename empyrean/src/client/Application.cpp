#include <stdlib.h>
#include <sstream>
#include <stdexcept>

#include "Application.h"
#include "GLUtility.h"
#include "IntroState.h"
#include "NSPRUtility.h"
#include "OpenGL.h"
#include "Profiler.h"
#include "Texture.h"

namespace pyr {

    typedef IntroState InitialState;


    PYR_DEFINE_SINGLETON(Application)
    
    Application::Application() {
        _width  = 0;
        _height = 0;
        _lastX = 0;
        _lastY = 0;
        _currentState = new InitialState();
        _showCPUInfo = false;
        
        _totalFadeTime = 0;
        _currentFadeTime = 0;

        gltext::FontPtr font = gltext::OpenFont("fonts/Vera.ttf", 24);
        _renderer = gltext::CreateRenderer(gltext::TEXTURE, font);
        if (!_renderer) {
            throw std::runtime_error("Creating font renderer failed");
        }
        
        _pointer = Texture::create("images/pointer.png");
    }
    
    Application::~Application() {
        // This destructor has to be here so code to delete States is
        // generated while the State class is fully defined.
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
            PYR_PROFILE_BLOCK("displayProfile");

            setOrthoProjection(1024, 768);

            glEnable(GL_TEXTURE_2D);
            glEnable(GL_BLEND);
            glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
            glColor4f(1, 1, 1, 1);

            const Profiler::BlockMap& bm = the<Profiler>().getBlockMap();
            float totaltime              = the<Profiler>().getTotalTime();

            GLTEXT_STREAM(_renderer) << "FPS: " << _fps.getFPS();

            for (Profiler::BlockMap::const_iterator iter = bm.begin(); iter != bm.end(); ++iter) {
                glTranslatef(0,24,0);
                int i = int(iter->second->total.time() / totaltime * 100);
                GLTEXT_STREAM(_renderer) << iter->first << ": " << i << "%";
            }
        }
    }

    void Application::update(float dt) {
        PYR_PROFILE_BLOCK("Application::update");

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
