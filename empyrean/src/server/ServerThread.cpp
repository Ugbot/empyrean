#include <vector>
#include "Configuration.h"
#include "Connection.h"
#include "ListenerThread.h"
#include "NSPRUtility.h"
#include "ServerLog.h"
#include "ServerThread.h"
#include "World.h"


namespace pyr {

    void ServerThread::run(Thread* self) {
        World world;

        int port = the<Configuration>().serverPort;
        
        ListenerThread* listener = new ListenerThread(port);
        ScopedPtr<Thread> thread(new Thread(listener, PR_PRIORITY_HIGH));
        
        char str[80];
        sprintf(str, "%d", port);
        logMessage("Listening on port " + std::string(str));
        
        float last = getNow();
        while (!self->shouldQuit()) {
            float now = getNow();
            float dt = now - last;
            last = now;
            
            std::vector<Connection*> connections;
            listener->getConnections(connections);
            for (size_t i = 0; i < connections.size(); ++i) {
                world.addConnection(connections[i]);
            }
            
            world.update(dt);
            PR_Sleep(secondsToInterval(0.050f));
        }
    }

}
