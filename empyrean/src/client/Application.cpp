#include <iomanip>
#include <stdlib.h>
#include <sstream>
#include <stdexcept>

#include "Application.h"
#include "GLUtility.h"
#include "IntroState.h"
#include "NSPRUtility.h"
#include "OpenGL.h"
#include "Profiler.h"
#include "Renderer.h"
#include "Texture.h"

namespace pyr {

    typedef IntroState InitialState;


    PYR_DEFINE_SINGLETON(Application)

    
    Application::Application() {
        _currentState = new InitialState();
        
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
                beginPass(OrthoProjection(_width, _height));
                drawTexture(
                    Vec2f(float(_lastX), float(_lastY)),
                    _pointer);
                endPass();
            }
        }
        if (_fadingState && _totalFadeTime != 0) {
            _fadingState->draw(_currentFadeTime / _totalFadeTime);
        }

        if (_showCPUInfo) {
            PYR_PROFILE_BLOCK("displayProfile");

            beginPass(OrthoProjection(1024, 768));

            // Display FPS & profile tree.
            PYR_TEXT_STREAM(_renderer, Vec2f(0, 0)) << "FPS: " << _fps.getFPS();

            if (_showCPUInfo == 2) {
                renderCallTree(0, the<Profiler>().getLastCallTree(), Vec2f(0, 24));
            }

            endPass();
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

        _lastX += static_cast<int>(_velX * dt);
        _lastY += static_cast<int>(_velY * dt);

        _fps.update(dt);
    }

    void Application::onKeyPress(SDLKey key, bool down) {
        if (down && key == SDLK_F1) {
            _showCPUInfo = (_showCPUInfo + 1) % 3;
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

    void Application::onJoyPress(Uint8 button, bool down) {
        if (_currentState) {
            _currentState->onJoyPress(button,down);
        }
    }

    void Application::onJoyMove(int axis, float value) {
        if (_currentState) {
            _currentState->onJoyMove(axis,value);
        }
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

    int Application::renderCallTree(
        CallNodePtr parent,
        const CallNodeList& callTree,
        const Vec2f& offset)
    {
        static const float SPACING = 24;
        static const float INDENT = 32;

        int lines = 0;

        float totalTime = 0;
        for (CallNodeList::const_iterator i = callTree.begin(); i != callTree.end(); ++i) {
            CallNodePtr cn = *i;
            totalTime += cn->block->getAverageTotalTime();
        }

        for (CallNodeList::const_iterator i = callTree.begin(); i != callTree.end(); ++i) {
            CallNodePtr cn = *i;

            float y = lines * SPACING;

            PYR_TEXT_STREAM(_renderer, offset + Vec2f(0, y))
                << cn->block->getName();
            PYR_TEXT_STREAM(_renderer, Vec2f(350, offset[1] + y))
                << 100 * cn->block->getAverageTotalTime() / totalTime << "%";
            ++lines;

            lines += renderCallTree(cn, cn->children, offset + Vec2f(INDENT, y + SPACING));
        }

        return lines;
    }

    void Application::setMouseVelX(int X) {
        _velX = X;
    }

    void Application::setMouseVelY(int Y) {
        _velY = Y;
    }

    int Application::getMousePosX() {
        return _lastX;
    }

    int Application::getMousePosY() {
        return _lastY;
    }
}
