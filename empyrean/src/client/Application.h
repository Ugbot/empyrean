#ifndef PYR_APPLICATION_H
#define PYR_APPLICATION_H

#include <SDL.h>
#include <gltext.h>
#include "Utility.h"
#include "FPSCounter.h"
#include "Profiler.h"
#include "Singleton.h"

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

        void invokeTransition(State* state);
        void invokeTimedTransition(State* state, float seconds);
        bool shouldQuit();
        
        // Mouse hijacking
        void setMouseVelX(int X);
        void setMouseVelY(int Y);

        int getMousePosX();
        int getMousePosY();

    private:
        void renderCallTree(const CallNodeList& callTree);

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

        ScopedPtr<State> _currentState;
        ScopedPtr<State> _nextState;
        ScopedPtr<State> _fadingState;
        Zeroed<float> _totalFadeTime;
        Zeroed<float> _currentFadeTime;

        Inited<bool, false> _showCPUInfo;

        gltext::FontRendererPtr _renderer;
        Texture* _pointer;

        FPSCounter _fps;
    };
    
}

#endif
