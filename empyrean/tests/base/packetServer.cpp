#include <iostream>
#include "Connection.h"
#include "PacketTypes.h"
#include "ScopedPtr.h"
#include "ServerSocket.h"
#include "Socket.h"
using namespace std;
using namespace pyr;

int run() {
    ServerSocket listener(8765);

    Socket* socket = listener.accept();
    if (!socket) {
        cout << "Could not accept connection\n";
        return 1;
    }

    Connection c(socket);
    while (!c.isClosed()) {
        c.sendPacket(new AllowUpdatesPacket);
    }

    return 0;
}

int main() {
    PYR_EXCEPTION_TRAP({
        return run();
    })
}
