#ifndef PYR_STATE_H
#define PYR_STATE_H


#include "Application.h"
#include "Utility.h"


namespace pyr {

    class State {
    public:
        virtual ~State() { }
        virtual void draw() { }
        virtual void update(float dt) { }
        virtual void onKeyPress(SDLKey key, bool down) { }
        virtual void onMousePress(Uint8 button, bool down, int x, int y) { }
        virtual void onMouseMove(int x, int y) { }
        
        template<typename T>
        void invokeTransition(Type2Type<T> = Type2Type<T>()) {
            Application::instance().invokeTransition(new T());
        }
    };

}


#endif
