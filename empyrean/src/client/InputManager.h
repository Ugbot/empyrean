#ifndef PYR_INPUT_MANAGER_H
#define PYR_INPUT_MANAGER_H


#include <map>
#include <string>
#include <SDL.h>


namespace pyr {

    class Input;

    class InputManager {
    public:
        ~InputManager();
        
        Input& getInput(const std::string& name);
        
        void update(float dt);
    
        // keyboard
        void onKeyPress(SDLKey key, bool down);
            
        // mouse
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        void onJoyPress(Uint8 button, bool down);
        void onJoyMove(int axis, int value);

    private:
        static std::string getSDLKeyName(SDLKey key);
        static std::string getSDLButtonName(Uint8 button);
    
        typedef std::map<std::string, Input*> InputMap;
        InputMap _inputMap;
    };

}


#endif
