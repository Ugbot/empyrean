#ifndef PYR_SCOPED_LOCK_H
#define PYR_SCOPED_LOCK_H


#include "Mutex.h"


namespace pyr {

    class ScopedLock {
    public:
        ScopedLock(Mutex& m) {
            _mutex = &m;
            _mutex->lock();
        }
        
        ~ScopedLock() {
            _mutex->unlock();
        }

    private:    
        Mutex* _mutex;
    };

}


#endif
