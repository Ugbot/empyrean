#include <iostream>
#include <SDL_thread.h>
#include "Error.h"
#include "SDLUtility.h"
#include "Thread.h"
#include "Utility.h"


namespace pyr {

    Thread::Thread() {
        if (!SDL_CreateThread(threadRoutine, this)) {
            throwSDLError("SDL_CreateThread() failed");
        }
    }
    
    int Thread::threadRoutine(void* self) {
        ScopedPtr<Thread> This(static_cast<Thread*>(self));
        try {
            This->run();
            return EXIT_SUCCESS;
        }
        catch (const std::exception& e) {
            error("Caught exception: " + std::string(e.what()));
        }
//        catch (...) {
//            error("Caught unknown exception");
//        }
        return EXIT_FAILURE;
    }

}
