#ifndef PYR_APPLICATION_H
#define PYR_APPLICATION_H

#include <SDL.h>
#include <gltext.h>
#include "FPSCounter.h"
#include "Profiler.h"
#include "ScopedPtr.h"
#include "Singleton.h"
#include "VecMath.h"

namespace pyr {

    class State;
    class Texture;

    /// Lazily-instantiated singleton class representing the game as a whole.
    class Application {
        PYR_DECLARE_SINGLETON(Application)

        Application();
        ~Application();
        
    public:
        void resize(int width, int height);
        int getWidth()  { return _width; }
        int getHeight() { return _height; }
        
        void draw();
        
        /// @param dt  elapsed time in milliseconds
        void update(float dt);
        
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        
        /// @param value  normalized axis value in range [-1, 1]
        void onJoyMove(int axis, float value);
        void onJoyPress(Uint8 button, bool down);

        void quit();
        bool shouldQuit() const;
        void invokeTransition(State* state);
        
        // Mouse hijacking
        void setMouseVelX(int X);
        void setMouseVelY(int Y);

        int getMousePosX();
        int getMousePosY();

    private:
        int renderCallTree(
            CallNodePtr parent,
            const CallNodeList& callTree,
            const Vec2f& offset);

	void checkOpenGLErrors();

        // dimensions of the window or screen
        Zeroed<int> _width;
        Zeroed<int> _height;

        // last position of the mouse (so we can notify new states of
        // the mouse's position)
        Zeroed<int> _lastX;
        Zeroed<int> _lastY;

        // Velocity of the mouse based on joystick input
        Zeroed<int> _velX;
        Zeroed<int> _velY;

        Inited<bool, false> _shouldQuit;
        ScopedPtr<State> _currentState;
        ScopedPtr<State> _nextState;

        /// 0 = show nothing, 1 = show FPS, 2 = show profiler
        Zeroed<int> _showCPUInfo;

        gltext::FontRendererPtr _renderer;
        Texture* _pointer;

        FPSCounter _fps;
    };
    
}

#endif
