#ifndef PYR_STATE_H
#define PYR_STATE_H


#include <SDL.h>
#include "Utility.h"


namespace pyr {

    class State;

    /**
     * This class lets you instantiate states and invoke transitions
     * without needing to include the state's header directly.  It just
     * has to be listed in State.cpp.
     */
    template<typename T>
    struct StateFactory {
        static State* create();
    };

    class State {
    public:
        virtual ~State() { }

	virtual const char* getName() const = 0;

        // The order of the update and draw methods in this class reflect the
        // fact that update is called just before draw in order to minimize
        // perceived system latency.  (Or maybe it's just a wrong guess.)

        /// @param dt  elapsed time in seconds
        virtual void update(float dt) { }
        virtual void draw() = 0;

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
        static void invokeTransition() {
            invokeStateTransition(StateFactory<T>::create());
        }

        static void quit();

        void showPointer() { _pointerVisible = true;  }
        void hidePointer() { _pointerVisible = false; }

    private:
        // This can't be called invokeTransition because gcc 3.2 is a whore.
        static void invokeStateTransition(State* state);

        Inited<bool, false> _pointerVisible;
    };


    template<typename T>
    State* instantiateState() {
        return StateFactory<T>::create();
    }

}


#endif
