#include <iostream>
#include "Connection.h"
#include "Error.h"
#include "PacketTypes.h"
#include "ScopedPtr.h"
#include "Socket.h"
using namespace std;
using namespace pyr;

int run() {
    Connection c(new Socket("localhost", 8765));
    cout << "Connected\n";
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
