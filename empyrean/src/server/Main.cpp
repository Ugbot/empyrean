#include <iostream>
#include <stdexcept>
#include "Error.h"
#include "ListenerThread.h"
#include "NSPRUtility.h"
#include "Utility.h"
#include "World.h"


namespace pyr {

    static int PORT = 8765;
    

    void runServer() {
        World world;
    
        ListenerThread* listener = new ListenerThread(PORT);
        ScopedPtr<Thread> thread(new Thread(listener));
        
        float last = getNow();
        for (;;) {
            float now = getNow();
            float dt = now - last;
            last = now;
            
            std::vector<Connection*> connections;
            listener->getConnections(connections);
            for (unsigned i = 0; i < connections.size(); ++i) {
                world.addConnection(connections[i]);
            }
            
            world.update(dt);
            PR_Sleep(secondsToInterval(0.020f));
        }
    }
}


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
