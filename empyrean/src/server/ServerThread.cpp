#include <vector>
#include "Configuration.h"
#include "Connection.h"
#include "Constants.h"
#include "ListenerThread.h"
#include "Log.h"
#include "NSPRUtility.h"
#include "Server.h"
#include "ServerLog.h"
#include "ServerThread.h"

namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.ServerThread");
    }

    void ServerThread::run(Thread* self) {
        PYR_LOG_SCOPE(_logger, INFO, "ServerThread::run");
        Server server;

        int port = the<Configuration>().serverPort;
        ListenerThread* listener = new ListenerThread(port);
        ScopedPtr<Thread> thread(new Thread(listener, PR_PRIORITY_HIGH));

        PYR_SERVER_LOG() << "Listening on port " << port;

        float last = getNow();
        float accumulatedTime = 0;
        while (!self->shouldQuit()) {
            PYR_LOG_SCOPE(_logger, INFO, "ServerThread: update loop");

            float now = getNow();
            float dt = now - last;
            last = now;

            {
                PYR_LOG_SCOPE(_logger, INFO, "ServerThread: get connections");
                std::vector<Connection*> connections;
                listener->getConnections(connections);
                for (size_t i = 0; i < connections.size(); ++i) {
                    server.addConnection(connections[i]);
                }
            }

            if (dt > constants::DT_CAP) {
                PYR_SERVER_LOG() << "Warning, time between updates too large.  It was " << dt << " seconds.";
                PYR_SERVER_LOG() << "It is now being set to " << constants::DT_CAP;
                dt = constants::DT_CAP;
            }

            accumulatedTime += dt;
            while (accumulatedTime > constants::SERVER_DT) {
                accumulatedTime -= constants::SERVER_DT;
                server.update(constants::SERVER_DT);
            }

            // Cap dt to threshold.
            if (dt > constants::DT_CAP) {
                dt = constants::DT_CAP;
            }

            // Sleep for a teeny bit.
            PR_Sleep(secondsToInterval(0.005f));
        }
    }

}
