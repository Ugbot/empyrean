#include <vector>
#include "Configuration.h"
#include "Connection.h"
#include "ListenerThread.h"
#include "NSPRUtility.h"
#include "ServerThread.h"
#include "World.h"


namespace pyr {

    ServerThread::ServerThread() {
        
    }

    void ServerThread::run() {
        World world;

        int port = Configuration::instance().getServerPort();
        
        /// @todo IS THIS A LEAK?
        ListenerThread* listener = new ListenerThread(port);
        ScopedPtr<Thread> thread(new Thread(listener, PR_PRIORITY_HIGH));
        
        float last = getNow();
        while (!shouldQuit()) {
            float now = getNow();
            float dt = now - last;
            last = now;
            
            std::vector<Connection*> connections;
            listener->getConnections(connections);
            for (unsigned i = 0; i < connections.size(); ++i) {
                world.addConnection(connections[i]);
            }
            
            world.update(dt);
            PR_Sleep(secondsToInterval(0.050f));
        }
    }

}
