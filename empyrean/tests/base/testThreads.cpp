#include <sstream>
#include "Log.h"
#include "PacketTypes.h"
#include "Platform.h"
#include "Thread.h"
using namespace std;
using namespace pyr;


struct Foo : public Runnable {
    void run(Thread* thread) {
        while (!thread->shouldQuit()) {
            static PacketPtr p = new LoginPacket("username", "password", 12);
            p->log();
        }
    }
};

struct Bar : public Runnable {
    void run(Thread* thread) {
        while (!thread->shouldQuit()) {
            static PacketPtr p = new JoinGamePacket("game", "pass", 32);
            p->log();
        }
    }
};


int run() {
    ScopedPtr<Thread> foo(new Thread("Foo", new Foo));
    ScopedPtr<Thread> bar(new Thread("Bar", new Bar));
    foo->join();
    bar->join();
    return 0;
}


int main(int argc, const char** argv) {
    PYR_EXCEPTION_TRAP({
        setStartDirectory(argv[0]);
        Logger::get("").setLevel(VERBOSE);
        initializeLog("testThreads.log", "testThreads.log.config");
        return run();
    })
}
