#include <iomanip>
#include <stdlib.h>
#include <sstream>
#include <stdexcept>

#include "Application.h"
#include "GLUtility.h"
#include "NSPRUtility.h"
#include "OpenGL.h"
#include "Profiler.h"
#include "Renderer.h"
#include "ServerConnection.h"
#include "State.h"
#include "Texture.h"
//#include "VisDebug.h"

namespace pyr {

    // For Dr. Reiners: select one of these for the different demos.
    typedef class TreeState  InitialState;
    //typedef class GrassState InitialState;
    //typedef class IntroState InitialState;


    namespace {
    
        Logger& _logger = Logger::get("pyr.Application");
    
    }

    PYR_DEFINE_SINGLETON(Application)
    

    void glow() {
        PYR_PROFILE_BLOCK("glow");

        static bool inited = false;
        static GLuint screenTexture;
        static GLuint smallTexture;

        if (!inited) {
            glGenTextures(1, &screenTexture);
            glBindTexture(GL_TEXTURE_2D, screenTexture);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR); // No mipmaps.

            glGenTextures(1, &smallTexture);
            glBindTexture(GL_TEXTURE_2D, smallTexture);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR); // No mipmaps;

            glBindTexture(GL_TEXTURE_2D, 0);
            inited = true;
        }

        OrthoProjection(1, 1, 0).apply();

        glBindTexture(GL_TEXTURE_2D, screenTexture);
        int appWidth  = the<Application>().getWidth();
        int appHeight = the<Application>().getHeight();
        int texWidth  = getNextPowerOf2(appWidth);
        int texHeight = getNextPowerOf2(appHeight);
        glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, 0, texWidth, texHeight, 0);

        const float u1 = float(appWidth) / texWidth;
        const float v1 = float(appHeight) / texHeight;

        glViewport(0, 0, 256, 256);
        glEnable(GL_TEXTURE_2D);
        glBegin(GL_QUADS);
          glTexCoord2f(0,  v1); glVertex2i(0, 0);
          glTexCoord2f(0,  0);  glVertex2i(0, 1);
          glTexCoord2f(u1, 0);  glVertex2i(1, 1);
          glTexCoord2f(u1, v1); glVertex2i(1, 0);
        glEnd();

        glBindTexture(GL_TEXTURE_2D, smallTexture);
        glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, 0, 256, 256, 0);

        glViewport(0, 0, appWidth, appHeight);

        const float u2 = 1;
        const float v2 = 1;

        glActiveTextureARB(GL_TEXTURE0_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, smallTexture);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

        checkOpenGLErrors();

        glActiveTextureARB(GL_TEXTURE1_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, smallTexture);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

        checkOpenGLErrors();

        /*
        glActiveTextureARB(GL_TEXTURE2_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, smallTexture);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);
        */

        checkOpenGLErrors();

        glActiveTextureARB(GL_TEXTURE3_ARB);
        glEnable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, screenTexture);
        glTexEnvi(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_ADD);

        checkOpenGLErrors();

        glColor4f(0.6f, 0.6f, 0.6f, 1.0f);
        glBegin(GL_QUADS);
          glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, v2);
          glMultiTexCoord2fARB(GL_TEXTURE1_ARB, 0, v2);
          glMultiTexCoord2fARB(GL_TEXTURE2_ARB, 0, v2);
          glMultiTexCoord2fARB(GL_TEXTURE3_ARB, 0, v1);
          glVertex2i(0, 0);

          glMultiTexCoord2fARB(GL_TEXTURE0_ARB, 0, 0);
          glMultiTexCoord2fARB(GL_TEXTURE1_ARB, 0, 0);
          glMultiTexCoord2fARB(GL_TEXTURE2_ARB, 0, 0);
          glMultiTexCoord2fARB(GL_TEXTURE3_ARB, 0, 0);
          glVertex2i(0, 1);

          glMultiTexCoord2fARB(GL_TEXTURE0_ARB, u2, 0);
          glMultiTexCoord2fARB(GL_TEXTURE1_ARB, u2, 0);
          glMultiTexCoord2fARB(GL_TEXTURE2_ARB, u2, 0);
          glMultiTexCoord2fARB(GL_TEXTURE3_ARB, u1, 0);
          glVertex2i(1, 1);

          glMultiTexCoord2fARB(GL_TEXTURE0_ARB, u2, v2);
          glMultiTexCoord2fARB(GL_TEXTURE1_ARB, u2, v2);
          glMultiTexCoord2fARB(GL_TEXTURE2_ARB, u2, v2);
          glMultiTexCoord2fARB(GL_TEXTURE3_ARB, u1, v1);
          glVertex2i(1, 0);
        glEnd();

        checkOpenGLErrors();

        glActiveTextureARB(GL_TEXTURE0_ARB);
        glDisable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);

        glActiveTextureARB(GL_TEXTURE1_ARB);
        glDisable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);

        glActiveTextureARB(GL_TEXTURE2_ARB);
        glDisable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);

        glActiveTextureARB(GL_TEXTURE3_ARB);
        glDisable(GL_TEXTURE_2D);
        glBindTexture(GL_TEXTURE_2D, 0);

        glActiveTextureARB(GL_TEXTURE0_ARB);
    }
    

    Application::Application() {
        _currentState = instantiateState<InitialState>();
        
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

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        if (_currentState) {
            _currentState->draw();
            checkOpenGLErrors();

            if (_currentState->isPointerVisible()) {
                beginPass(OrthoProjection(_width, _height));
                drawTexture(
                    Vec2f(float(_lastX), float(_lastY)),
                    _pointer,
                    true);
                endPass();
            }
        }

        if (_showCPUInfo) {
            PYR_PROFILE_BLOCK("displayProfile");

            beginPass(OrthoProjection(1024, 768));

            // Display FPS & profile tree.
            glColor4f(1, 1, 1, 1);
            PYR_TEXT_STREAM(_renderer, Vec2f(0, 0)) << "FPS: " << _fps.getFPS();

            if (_showCPUInfo == 2) {
                renderCallTree(0, the<Profiler>().getLastCallTree(), Vec2f(0, 24));
            }

            endPass();
        }
	checkOpenGLErrors();

        if (_glow) {
            glow();
        }
	checkOpenGLErrors();
    }

    void Application::update(float dt) {
        PYR_PROFILE_BLOCK("Application::update");
        
        // Update the ServerConnection before updating the states, since
        // network traffic can be considered input.
        the<ServerConnection>().update();

        //the<VisDebug>().clearSegs();
        //the<VisDebug>().clearPts();

        if (_currentState) {
            _currentState->update(dt);
        }
        if (_nextState) {
            _currentState = _nextState;
            _currentState->onMouseMove(_lastX, _lastY);
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

        if (down && key == SDLK_F10) {
            _glow = !_glow;
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
        PYR_ASSERT(state, "Can't transition to null state");
	PYR_LOG(_logger, INFO, "Switching to state: " << state->getName());
        _nextState = state;
    }
    
    void Application::quit() {
        _shouldQuit = true;
    }

    bool Application::shouldQuit() const {
        return _shouldQuit;
    }

    int Application::renderCallTree(
        CallNodePtr parent,
        const CallNodeList& callTree,
        const Vec2f& offset)
    {
        static const float SPACING = 24;
        static const float INDENT = 32;
        static const float PERCENT_COLUMN = 500;

        int lines = 0;

        float totalTime;
        if (parent) {
            totalTime = parent->block->getAverageTotalTime();
        } else {
            totalTime = 0;
            for (CallNodeList::const_iterator i = callTree.begin(); i != callTree.end(); ++i) {
                CallNodePtr cn = *i;
                totalTime += cn->block->getAverageTotalTime();
            }
        }

        for (CallNodeList::const_iterator i = callTree.begin(); i != callTree.end(); ++i) {
            CallNodePtr cn = *i;

            float y = lines * SPACING;

            PYR_TEXT_STREAM(_renderer, offset + Vec2f(0, y))
                << std::setprecision(3) << cn->block->getName();
            PYR_TEXT_STREAM(_renderer, Vec2f(PERCENT_COLUMN, offset[1] + y))
                << std::setprecision(3) << 100 * cn->block->getAverageTotalTime() / totalTime << "%";
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
