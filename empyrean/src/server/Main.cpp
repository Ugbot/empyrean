#include <iostream>
#include <stdexcept>
#include <SDL_net.h>
#include "ConnectionThread.h"
#include "Error.h"
#include "SDLUtility.h"


namespace pyr {

    static int PORT = 8765;
    
    void runServer() {
        initializeSDL(SDL_INIT_NOPARACHUTE);
        
        
        IPaddress address;
        if (SDLNet_ResolveHost(&address, 0, PORT) < 0) {
            throwSDLNetError("Could not resolve listen address");
        }
        
        TCPsocket listener = SDLNet_TCP_Open(&address);
        if (!listener) {
            throwSDLNetError("Listener socket creation failed");
        }
        
        try {
            for (;;) {
                TCPsocket connection = SDLNet_TCP_Accept(listener);
                if (connection) {
                    std::cout << "Connection" << std::endl;
                    new ConnectionThread(connection);
                }

                SDL_Delay(100);
            }
        }
        catch (...) {
            // make sure the listener is destroyed properly
            SDLNet_TCP_Close(listener);
            throw;
        }
        
        SDLNet_TCP_Close(listener);
    }
}


// main must be defined this way for SDL to work
int main(int /*argc*/, char* /*argv*/[]) {
    try {
        pyr::runServer();
        return EXIT_SUCCESS;
    }
    catch (const std::exception& e) {
        pyr::error("Caught exception: " + std::string(e.what()));
    }
    catch (...) {
        pyr::error("Caught unknown exception");
    }
    
    return EXIT_FAILURE;
}
