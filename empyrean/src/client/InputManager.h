#ifndef PYR_INPUT_MANAGER_H
#define PYR_INPUT_MANAGER_H


#include <map>
#include <string>
#include <SDL.h>


namespace pyr {

    class Input;

    class InputManager {
    public:
        static InputManager& instance();
        static void destroy();
    
    private:
        InputManager();
        ~InputManager();
        
    public:
        Input& getInput(const std::string& name);
        
        void update(float dt);
    
        // keyboard
        void onKeyPress(SDLKey key, bool down);
            
        // mouse
        void resize(int width, int height);
        void onMousePress(Uint8 button, bool down, int x, int y);
        void onMouseMove(int x, int y);
        
    private:
        static std::string getSDLKeyName(SDLKey key);
        static std::string getSDLButtonName(Uint8 button);
    
        static InputManager* _instance;
    
        int _width;
        int _height;
        
        typedef std::map<std::string, Input*> InputMap;
        InputMap _inputMap;
    };

}


#endif
