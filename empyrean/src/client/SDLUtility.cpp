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

}
