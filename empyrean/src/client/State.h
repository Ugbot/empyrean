#ifndef PYR_STATE_H
#define PYR_STATE_H


#include "Application.h"
#include "Utility.h"


namespace pyr {

    class State {
    public:
        virtual ~State() { }
        
        // The order of the update and draw methods in this class reflect the
        // fact that update is called just before draw in order to minimize
        // perceived system latency.  (Or maybe it's just a wrong guess.)

        /// @param dt  elapsed time in seconds
        virtual void update(float dt) { }

        /**
         * @param fade  normalized value [0,1] representing how
         *              much fade has happened
         */
        virtual void draw(float fade) { }

        virtual void onKeyPress(SDLKey key, bool down) { }
        virtual void onMousePress(Uint8 button, bool down, int x, int y) { }
        virtual void onMouseMove(int x, int y) { }
        virtual void onJoyPress(Uint8 button, bool down) { }
        virtual void onJoyMove(int axis, float value) { }

        bool isPointerVisible() const {
            return _pointerVisible;
        }

    protected:
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
        
        void showPointer() { _pointerVisible = true;  }
        void hidePointer() { _pointerVisible = false; }
               
    private:
        Inited<bool, false> _pointerVisible;
    };

}


#endif
