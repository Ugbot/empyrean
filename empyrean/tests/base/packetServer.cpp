#include <iostream>
#include "Connection.h"
#include "Log.h"
#include "PacketTypes.h"
#include "Platform.h"
#include "ScopedPtr.h"
#include "ServerSocket.h"
#include "Socket.h"
using namespace std;
using namespace pyr;

const int PORT = 8765;

int run() {
    ServerSocket listener(PORT);

    cout << "Listening on port " << PORT << endl;

    Socket* socket = listener.accept();
    if (!socket) {
        cout << "Could not accept connection\n";
        return 1;
    }
    
    cout << "Got connection\n";

    Connection c(socket);
    while (!c.isClosed()) {
        c.sendPacket(new AllowUpdatesPacket);
    }

    return 0;
}

int main(int argc, char** argv) {
    PYR_EXCEPTION_TRAP({
        setStartDirectory(argv[0]);
        initializeLog("packetServer.log", "packetServer.log.config");
        return run();
    })
}
