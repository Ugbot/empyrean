#ifndef PYR_SDL_UTILITY_H
#define PYR_SDL_UTILITY_H


#include <stdexcept>
#include <string>
#include <SDL.h>


namespace pyr {

    inline void throwSDLError(const std::string& prefix) {
        throw std::runtime_error(prefix + ": " + SDL_GetError());
    }
    
    /**
     * Initializes SDL (with initflags).  Also registers
     * atexit callbacks to shut down SDL.
     *
     * @param initflags  flags normally passed to SDL_Init
     *
     * @throws  std::runtime_error if initialization fails
     */
    void initializeSDL(int initflags);

    /**
     * Normalizes a joystick axis value from the range [-32768, 32767] to [-1, 1].
     */
    float normalizeAxisValue(int axis);

}


#endif
