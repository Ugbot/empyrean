#include <iostream>
#include "Connection.h"
#include "Error.h"
#include "NSPRUtility.h"
#include "PacketTypes.h"
#include "ScopedPtr.h"
#include "Socket.h"
using namespace std;
using namespace pyr;

const int PORT = 8765;

int run() {
    Connection c(new Socket("localhost", PORT));
    cout << "Connected\n";

    float elapsed = 0.0f;
    float last = getNow();
    unsigned count = 0;

    while (!c.isClosed()) {
        c.sendPacket(new AllowUpdatesPacket);
        ++count;

        const float now = getNow();
        const float dt  = now - last;
        last = now;

        elapsed += dt;

        if (elapsed > 1) {
            float rate = count / elapsed;
            cout << "Sending " << rate << " packets/second" << endl;
            count = 0;
            elapsed = 0;
        }
    }
    return 0;
}

int main() {
    PYR_EXCEPTION_TRAP({
        return run();
    })
}
