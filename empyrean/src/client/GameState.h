#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H

#include <gltext.h>
#include <vector>
#include "InputManager.h"
#include "State.h"

namespace pyr {

    class GameState : public State {
    public:
        GameState();
        
        void draw(float fade);
        void update(float dt);
        
        void onKeyPress(SDLKey key, bool down);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        void onJoyPress(Uint8 button, bool down);
        void onJoyMove(int axis, float value);
        
    private:
        InputManager _im;
	Input* _inputLeft;
	Input* _inputRight;
        Input* _inputJump;
        Input* _inputAttack;
        Input* _inputQuit;
        Input* _inputJoyX;
        Input* _inputJoyJump;
        Input* _inputJoyStart;
        Input* _inputJoyAttack;

        Zeroed<int> _lastJoyX;
        Inited<bool, false> _showPlayerData;
        gltext::FontRendererPtr _renderer;
    };

}


#endif
