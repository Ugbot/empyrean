
#include "SDLUtility.h"


namespace pyr {

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
