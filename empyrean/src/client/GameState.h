#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H


#include "InputManager.h"
#include "State.h"


namespace pyr {

    class GameState : public State {
    public:
        GameState();
        
        void draw();
        void update(float dt);
        
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        
    private:
        InputManager _im;
        Input* _inputX;
        Input* _inputY;
        Input* _inputLeft;
        Input* _inputRight;
        
        float _rotation;
    };

}


#endif
