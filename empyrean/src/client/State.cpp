#include "Application.h"
#include "State.h"

#include "CreditsState.h"
#include "CutSceneState.h"
#include "GameState.h"
#include "IntroState.h"
#include "LobbyState.h"
#include "MenuState.h"


namespace pyr {

    #define PYR_ENABLE_STATE(StateT)                            \
        State* StateFactory<StateT>::create() {                 \
            return new StateT;                                  \
        }
    
    
    PYR_ENABLE_STATE(CreditsState)
    PYR_ENABLE_STATE(CutSceneState)
    PYR_ENABLE_STATE(GameState)
    PYR_ENABLE_STATE(IntroState)
    PYR_ENABLE_STATE(LobbyState)
    PYR_ENABLE_STATE(MenuState)
    

    void State::invokeStateTransition(State* state) {
        the<Application>().invokeTransition(state);
    }

    void State::quit() {
        the<Application>().quit();
    }

}
