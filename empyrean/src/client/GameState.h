#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H


#include "State.h"


namespace pyr {

    class Input;

    class GameState : public State {
    public:
        GameState();
        ~GameState();
        
        void draw();
        void update(float dt);
        
    private:
        Input* _inputX;
        Input* _inputY;
        Input* _inputLeft;
        Input* _inputRight;
        
        float _rotation;
    };

}


#endif
