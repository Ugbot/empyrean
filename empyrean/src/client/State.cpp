#include "Application.h"
#include "State.h"


namespace pyr {

    void State::invokeStateTransition(State* state) {
        the<Application>().invokeTransition(state);
    }

    void State::quit() {
        the<Application>().quit();
    }

}
