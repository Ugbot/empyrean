#include "SDLUtility.h"


namespace pyr {

    void quitSDL() {
        SDL_Quit();
    }

    void quitSDLNet() {
        SDLNet_Quit();
    }

    void initializeSDL(int initflags) {
        if (SDL_Init(initflags) < 0) {
            throwSDLError("SDL initialization failed");
        }
        atexit(quitSDL);
        
        if (SDLNet_Init() < 0) {
            throwSDLNetError("SDLNet initialization failed");
        }
        atexit(quitSDLNet);
    }

}
