#include <iostream>
#include <queue>
#include <stdlib.h>
#include "CondVar.h"
#include "Log.h"
#include "PacketTypes.h"
#include "Platform.h"
#include "ScopedLock.h"
#include "Thread.h"
using namespace pyr;
using namespace std;


CondVar _cv;
queue<PacketPtr> _queue;


struct Producer : public Runnable {
    void run(Thread* thread) {
        while (!thread->shouldQuit()) {
            PYR_SYNCHRONIZED(_cv, {
                _queue.push(new AllowUpdatesPacket());
                _cv.notify();
            })
        }
    }
};

struct Consumer : public Runnable {
    void run(Thread* thread) {
        while (!thread->shouldQuit()) {
            PacketPtr p;

            PYR_SYNCHRONIZED(_cv, {
                while (_queue.empty()) {
                    _cv.wait(0.5f);
                    if (thread->shouldQuit()) {
                        return;
                    }
                }

                p = _queue.front();
                _queue.pop();
            })

            cout << p->getName() << endl;
        }
    }
};


int run() {
    ScopedPtr<Thread> c(new Thread("Consumer", new Consumer));
    ScopedPtr<Thread> p(new Thread("Producer", new Producer));
    c->join();
    p->join();
    return 0;
}


int main(int argc, char** argv) {
    PYR_EXCEPTION_TRAP({
        setStartDirectory(argv[0]);
        initializeLog("testCondVar.log", "testCondVar.log.config");
        return run();
    })
}
