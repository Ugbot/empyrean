#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H

#include <gltext.h>
#include <vector>
#include "InputManager.h"
#include "PlayerEntity.h"
#include "State.h"

namespace pyr {

    class GameState : public State {
    public:
        GameState();
        ~GameState();
        
        void draw(float fade);
        void update(float dt);
        
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        
    private:
        InputManager _im;
        Input* _inputMLeft;
        Input* _inputMRight;
	Input* _inputLeft;
	Input* _inputRight;
        Input* _inputSpace;
        Input* _inputQuit;
        
        gltext::FontRendererPtr _renderer;
        
        PlayerEntity* _player;
    };

}


#endif
