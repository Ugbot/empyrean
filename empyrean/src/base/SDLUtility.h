#ifndef PYR_SDL_UTILITY_H
#define PYR_SDL_UTILITY_H


#include <stdexcept>
#include <string>
#include <SDL.h>
#include <SDL_net.h>


namespace pyr {

    inline void throwSDLError(const std::string& prefix) {
        throw std::runtime_error(prefix + ": " + SDL_GetError());
    }
    
    inline void throwSDLNetError(const std::string& prefix) {
        throw std::runtime_error(prefix + ": " + SDLNet_GetError());
    }

    
    /**
     * Initializes SDL (with initflags) and SDL_net.  Also registers
     * atexit callbacks to shut down SDL and SDL_net.
     *
     * @param initflags  flags normally passed to SDL_Init
     *
     * @throws  std::runtime_error if initialization fails
     */
    void initializeSDL(int initflags);

}


#endif
