#include "Input.h"
#include "InputManager.h"


namespace pyr {

    InputManager* InputManager::_instance = 0;

    InputManager& InputManager::instance() {
        if (!_instance) {
            _instance = new InputManager();
            atexit(destroy);
        }
        return *_instance;
    }
    
    void InputManager::destroy() {
        delete _instance;
        _instance = 0;
    }
    
    InputManager::InputManager() {
        _width = 0;
        _height = 0;
    }
    
    InputManager::~InputManager() {
        for (InputMap::iterator i = _inputMap.begin(); i != _inputMap.end(); ++i) {
            delete i->second;
        }
    }
    
    Input& InputManager::getInput(const std::string& name) {
        Input* input = _inputMap[name];
        if (!input) {
            input = new Input();
            _inputMap[name] = input;
        }
        
        return *input;
    }
    
    void InputManager::update(float dt) {
        for (InputMap::iterator i = _inputMap.begin(); i != _inputMap.end(); ++i) {
            i->second->update(dt);
        }
    }
    
    void InputManager::onKeyPress(SDLKey key, bool down) {
        getInput(getSDLKeyName(key)).setValue(down ? 1.0f : 0.0f);
    }
    
    void InputManager::resize(int width, int height) {
        _width  = width;
        _height = height;
    }
    
    void InputManager::onMousePress(Uint8 button, bool down, int x, int y) {
        getInput(getSDLButtonName(button)).setValue(down ? 1.0f : 0.0f);
    }
    
    void InputManager::onMouseMove(int x, int y) {
        if (_width > 0) {
            getInput("MouseX").setValue(float(x) / _width);
        }
        if (_height > 0) {
            getInput("MouseY").setValue(float(y) / _height);
        }
    }
    
    std::string InputManager::getSDLKeyName(SDLKey key) {
        return "UnknownKey";
    }
    
    std::string InputManager::getSDLButtonName(Uint8 button) {
        switch (button) {
            case SDL_BUTTON_LEFT:   return "MouseLeft";
            case SDL_BUTTON_MIDDLE: return "MouseMiddle";
            case SDL_BUTTON_RIGHT:  return "MouseRight";
            default:                return "UnknownButton";
        }
    }

}
