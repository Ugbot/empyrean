#ifndef PYR_GAME_STATE_H
#define PYR_GAME_STATE_H

#include <audiere.h>
#include <gltext.h>
#include <vector>
#include "HUD.h"
#include "InputManager.h"
#include "Player.h"
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
        void onJoyPress(Uint8 button, bool down);
        void onJoyMove(int axis, float value);
        
    private:
        void comboInterpreter(float dt);
        std::string checkFastCombos();

        audiere::AudioDevicePtr _device;
        audiere::SoundEffectPtr _sfx;

        InputManager _im;
        Input* _inputLeft;
        Input* _inputRight;
        Input* _inputJump;
        Input* _inputAttack;
        Input* _inputAttackA;
        Input* _inputAttackB;
        Input* _inputQuit;
        Input* _inputJoyX;
        Input* _inputJoyJump;
        Input* _inputJoyStart;
        Input* _input1;
        Input* _input2;
        Input* _input3;
        Input* _input4;
        Input* _inputJoyAttack;

        Player _player;
        HUD _hud;

        struct comboEvent {
            comboEvent(std::string t) {
                type = t;
                timer = 0;
            }

            std::string type;
            double timer;
        };

        struct comboDef {
            std::string name;
            std::vector<std::string> act;
        };

        std::vector<comboEvent> fastCombo;
        std::vector<comboDef> fastComboDefs; 

        Inited<bool, false> _showPlayerData;
        Zeroed<int> _lastJoyX;
        gltext::FontRendererPtr _renderer;
    };

}


#endif
