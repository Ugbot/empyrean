#include <iostream>
#include <stdexcept>
#include "Error.h"
#include "ListenerThread.h"
#include "Utility.h"
#include "World.h"


namespace pyr {

    static int PORT = 8765;
    

    void runServer() {
        World& world = World::instance();
    
        ScopedPtr<Thread> listener(new ListenerThread(PORT));
        listener->start();
        
        PRIntervalTime last = PR_IntervalNow();        
        for (;;) {
            PRIntervalTime now = PR_IntervalNow();
            float dt = 1000000.0f * PR_IntervalToMicroseconds(now - last);
            last = now;
        
            world.update(dt);
            PR_Sleep(20);
        }
    }
}


// main must be defined this way for SDL to work
int main() {
    try {
        pyr::runServer();
        return EXIT_SUCCESS;
    }
    catch (const std::exception& e) {
        pyr::error("Caught exception: " + std::string(e.what()));
    }
//    catch (...) {
//        pyr::error("Caught unknown exception");
//    }
    
    return EXIT_FAILURE;
}
