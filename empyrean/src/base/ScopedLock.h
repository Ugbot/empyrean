#ifndef PYR_SCOPED_LOCK_H
#define PYR_SCOPED_LOCK_H


#include "Lock.h"
#include "Utility.h"


namespace pyr {

    class ScopedLock {
    public:
        ScopedLock(Lock* lock) {
            _lock = lock;
            _lock->lock();
        }
    
        ScopedLock(Lock& lock) {
            _lock = &lock;
            _lock->lock();
        }
        
        ~ScopedLock() {
            _lock->unlock();
        }

    private:
        Lock* _lock;
    };
        
    #define PYR_SYNCHRONIZE_SCOPE(mutex)        \
        ScopedLock PYR_UNIQUE_NAME()(mutex)
        
    #define PYR_SYNCHRONIZED(mutex, block) {    \
        PYR_SYNCHRONIZE_SCOPE(mutex);           \
        block                                   \
    }

}


#endif
