#include "SDLUtility.h"


namespace pyr {

    /**
     * SDL_Quit could have a different calling convention, since it comes
     * from another library.
     */
    void quitSDL() {
        SDL_Quit();
    }

    void initializeSDL(int initflags) {
        if (SDL_Init(initflags) < 0) {
            throwSDLError("SDL initialization failed");
        }
        atexit(quitSDL);
    }

    float normalizeAxisValue(int axis) {
        if (axis < 0) {
            return axis / 32768.0f;
        } else {
            return axis / 32767.0f;
        }
    }

}
