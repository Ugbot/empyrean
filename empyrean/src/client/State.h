#ifndef PYR_STATE_H
#define PYR_STATE_H


#include "Application.h"
#include "Utility.h"


namespace pyr {

    class State {
    public:
        State() {
            _pointerVisible = false;
        }
    
        virtual ~State() { }
        
        /**
         * @param fade  normalized value [0,1] representing how
         *              much fade has happened
         */
        virtual void draw(float fade) { }
        
        /// @param dt  elapsed time in seconds
        virtual void update(float dt) { }
        
        virtual void onKeyPress(SDLKey key, bool down) { }
        virtual void onMousePress(Uint8 button, bool down, int x, int y) { }
        virtual void onMouseMove(int x, int y) { }
        
        bool isPointerVisible() {
            return _pointerVisible;
        }
        
        
        template<typename T>
        static void invokeTransition(Type2Type<T> = Type2Type<T>()) {
            Application::instance().invokeTransition(new T());
        }
        
        template<typename T>
        static void invokeTimedTransition(
            float seconds,
            Type2Type<T> = Type2Type<T>())
        {
            Application::instance().invokeTimedTransition(new T(), seconds);
        }
        
        static void quit() {
            Application::instance().invokeTransition(0);
        }
        
    protected:
        void showPointer() { _pointerVisible = true;  }
        void hidePointer() { _pointerVisible = false; }
               
    private:
        bool _pointerVisible;
    };

}


#endif
