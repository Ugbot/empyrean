#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H


#include <vector>
#include "Entity.h"
#include "InputManager.h"
#include "State.h"

namespace pyr {

    class Renderer;
    class Model;

    class GameState : public State {
    public:
        GameState();
        
        void draw(float fade);
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
        Input* _inputQuit;

        Model* _testModel;
        Renderer* _renderer;
        
        std::vector<Entity*> _entities;
        
        float _rotation;
    };

}


#endif
