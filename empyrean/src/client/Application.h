#ifndef PYR_APPLICATION_H
#define PYR_APPLICATION_H


#include <SDL.h>
#include "Utility.h"


namespace pyr {

    class State;

    /// Lazily-instantiated singleton class representing the game as a whole.
    class Application {
    public:
        static Application& instance();
        static void destroy();

    private:
        Application();
        
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
        
        void invokeTransition(State* state);
        void invokeTimedTransition(State* state, float seconds);
        bool shouldQuit();

    private:
        static Application* _instance;
    
        // dimensions of the window or screen
        int _width;
        int _height;
        
        // last position of the mouse (so we can notify new states of
        // the mouse's position)
        int _lastX;
        int _lastY;
                
        ScopedPtr<State> _currentState;
        ScopedPtr<State> _nextState;
        ScopedPtr<State> _fadingState;
        float _totalFadeTime;
        float _currentFadeTime;
    };
    
}


#endif
