#ifndef PYR_MUTEX_H
#define PYR_MUTEX_H


#include <stdexcept>
#include <prlock.h>


namespace pyr {

    class Mutex {
    public:
        Mutex() {
            _lock = PR_NewLock();
            if (!_lock) {
                throw std::runtime_error("PR_NewLock() failed");
            }
        }
        
        ~Mutex() {
            PR_DestroyLock(_lock);
        }
        
        void lock() {
            PR_Lock(_lock);
        }
        
        void unlock() {
            PR_Unlock(_lock);
        }
        
    private:
        PRLock* _lock;
        
        friend class CondVar;
    };

}


#endif
