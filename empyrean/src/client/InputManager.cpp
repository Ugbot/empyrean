#include "Application.h"
#include "Input.h"
#include "InputManager.h"


namespace pyr {

    static std::map<std::string, SDLKey> gKeyMap;
    static std::map<SDLKey, std::string> gNameMap;

    class SDLKeyInit {
    public:
        SDLKeyInit() {
            mapKey("Escape",     SDLK_ESCAPE);
            mapKey("F1",         SDLK_F1);
            mapKey("F2",         SDLK_F2);
            mapKey("F3",         SDLK_F3);
            mapKey("F4",         SDLK_F4);
            mapKey("F5",         SDLK_F5);
            mapKey("F6",         SDLK_F6);
            mapKey("F7",         SDLK_F7);
            mapKey("F8",         SDLK_F8);
            mapKey("F9",         SDLK_F9);
            mapKey("F10",        SDLK_F10);
            mapKey("F11",        SDLK_F11);
            mapKey("F12",        SDLK_F12);
            mapKey("F13",        SDLK_F13);
            mapKey("F14",        SDLK_F14);
            mapKey("F15",        SDLK_F15);
            mapKey("Tilde",      SDLK_BACKQUOTE);
            mapKey("Minus",      SDLK_MINUS);
            mapKey("Equals",     SDLK_EQUALS);
            mapKey("Backspace",  SDLK_BACKSPACE);
            mapKey("Tab",        SDLK_TAB);
            mapKey("A",          SDLK_a);
            mapKey("B",          SDLK_b);
            mapKey("C",          SDLK_c);
            mapKey("D",          SDLK_d);
            mapKey("E",          SDLK_e);
            mapKey("F",          SDLK_f);
            mapKey("G",          SDLK_g);
            mapKey("H",          SDLK_h);
            mapKey("I",          SDLK_i);
            mapKey("J",          SDLK_j);
            mapKey("K",          SDLK_k);
            mapKey("L",          SDLK_l);
            mapKey("M",          SDLK_m);
            mapKey("N",          SDLK_n);
            mapKey("O",          SDLK_o);
            mapKey("P",          SDLK_p);
            mapKey("Q",          SDLK_q);
            mapKey("R",          SDLK_r);
            mapKey("S",          SDLK_s);
            mapKey("T",          SDLK_t);
            mapKey("U",          SDLK_u);
            mapKey("V",          SDLK_v);
            mapKey("W",          SDLK_w);
            mapKey("X",          SDLK_x);
            mapKey("Y",          SDLK_y);
            mapKey("Z",          SDLK_z);
            mapKey("0",          SDLK_0);
            mapKey("1",          SDLK_1);
            mapKey("2",          SDLK_2);
            mapKey("3",          SDLK_3);
            mapKey("4",          SDLK_4);
            mapKey("5",          SDLK_5);
            mapKey("6",          SDLK_6);
            mapKey("7",          SDLK_7);
            mapKey("8",          SDLK_8);
            mapKey("9",          SDLK_9);
            mapKey("KP0",        SDLK_KP0);
            mapKey("KP1",        SDLK_KP1);
            mapKey("KP2",        SDLK_KP2);
            mapKey("KP3",        SDLK_KP3);
            mapKey("KP4",        SDLK_KP4);
            mapKey("KP5",        SDLK_KP5);
            mapKey("KP6",        SDLK_KP6);
            mapKey("KP7",        SDLK_KP7);
            mapKey("KP8",        SDLK_KP8);
            mapKey("KP9",        SDLK_KP9);
            mapKey("KPDivide",   SDLK_KP_DIVIDE);
            mapKey("KPMultiply", SDLK_KP_MULTIPLY);
            mapKey("KPMinus",    SDLK_KP_MINUS);
            mapKey("KPPlus",     SDLK_KP_PLUS);
            mapKey("KPEnter",    SDLK_KP_ENTER);
            mapKey("KPEquals",   SDLK_KP_EQUALS);
            mapKey("LShift",     SDLK_LSHIFT);
            mapKey("RShift",     SDLK_RSHIFT);
            mapKey("LCtrl",      SDLK_LCTRL);
            mapKey("RCtrl",      SDLK_RCTRL);
            mapKey("LAlt",       SDLK_LALT);
            mapKey("RAlt",       SDLK_RALT);
            mapKey("Space",      SDLK_SPACE);
            mapKey("OpenBrace",  SDLK_LEFTBRACKET);
            mapKey("CloseBrace", SDLK_RIGHTBRACKET);
            mapKey("SemiColon",  SDLK_SEMICOLON);
            mapKey("Apostrophe", SDLK_QUOTE);
            mapKey("Comma",      SDLK_COMMA);
            mapKey("Peroid",     SDLK_PERIOD);
            mapKey("KPPeriod",   SDLK_KP_PERIOD);
            mapKey("Slash",      SDLK_SLASH);
            mapKey("Backslash",  SDLK_BACKSLASH);
            mapKey("Enter",      SDLK_RETURN);
            mapKey("Insert",     SDLK_INSERT);
            mapKey("Delete",     SDLK_DELETE);
            mapKey("Home",       SDLK_HOME);
            mapKey("End",        SDLK_END);
            mapKey("PageUp",     SDLK_PAGEUP);
            mapKey("PageDown",   SDLK_PAGEDOWN);
            mapKey("Up",         SDLK_UP);
            mapKey("Down",       SDLK_DOWN);
            mapKey("Left",       SDLK_LEFT);
            mapKey("Right",      SDLK_RIGHT);
            mapKey("CapsLock",   SDLK_CAPSLOCK);
            mapKey("NumLock",    SDLK_NUMLOCK);
            mapKey("ScrollLock", SDLK_SCROLLOCK);
        }
        
    private:        
        void mapKey(const std::string& name, SDLKey key) {
            gKeyMap[name] = key;
            gNameMap[key] = name;
        }
    };

    static SDLKeyInit initKeys;



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
        if (gNameMap.count(key)) {
            return gNameMap[key];
        }
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
