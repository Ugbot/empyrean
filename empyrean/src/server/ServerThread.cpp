#include <vector>
#include "Configuration.h"
#include "Connection.h"
#include "Constants.h"
#include "ListenerThread.h"
#include "NSPRUtility.h"
#include "ServerLog.h"
#include "ServerThread.h"
#include "World.h"
#include "Log.h"

namespace pyr {

    void ServerThread::run(Thread* self) {
        World world;

        int port = the<Configuration>().serverPort;
        
        ListenerThread* listener = new ListenerThread(port);
        ScopedPtr<Thread> thread(new Thread(listener, PR_PRIORITY_HIGH));
        
        PYR_SERVER_LOG() << "Listening on port " << port;
        
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

            // Cap dt to threshold.
            if (dt > constants::DT_CAP) {
                PYR_SERVER_LOG() << "Warning, time between frames too large.  It was " << dt << " seconds.";
                PYR_SERVER_LOG() << "It is now being set to " << constants::DT_CAP;
                dt = constants::DT_CAP;
            }
            
            world.update(dt);
            PR_Sleep(secondsToInterval(0.050f));
        }
    }

}
