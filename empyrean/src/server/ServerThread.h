#ifndef PYR_SERVER_THREAD_H
#define PYR_SERVER_THREAD_H


#include "Thread.h"


namespace pyr {

    class ServerThread : public Runnable {
    public:
        void run(Thread* self);
    };

}


#endif
