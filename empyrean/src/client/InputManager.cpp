#include "Application.h"
#include "Input.h"
#include "InputManager.h"


namespace pyr {

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
    
    void InputManager::onMousePress(Uint8 button, bool down, int x, int y) {
        getInput(getSDLButtonName(button)).setValue(down ? 1.0f : 0.0f);
    }
    
    void InputManager::onMouseMove(int x, int y) {
        int width  = Application::instance().getWidth();
        int height = Application::instance().getHeight();
        if (width > 0) {
            getInput("MouseX").setValue(float(x) / width);
        }
        if (height > 0) {
            getInput("MouseY").setValue(float(y) / height);
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
