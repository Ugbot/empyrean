#ifndef PYR_COND_VAR_H
#define PYR_COND_VAR_H


#include <prcvar.h>
#include "Mutex.h"


namespace pyr {

    /**
     * See NSPR's condition variable documentation.
     */
    class CondVar {
    public:
        // create a condition variable based 
        CondVar(Mutex* m) {
            _cvar = PR_NewCondVar(m->_lock);
            if (!_cvar) {
                throw std::runtime_error("PR_NewCondVar() failed");
            }
        }
        
        ~CondVar() {
            PR_DestroyCondVar(_cvar);
        }
        
        void wait() {
            PRStatus status = PR_WaitCondVar(_cvar, PR_INTERVAL_NO_TIMEOUT);
            if (status != PR_SUCCESS) {
                throw std::runtime_error("PR_WaitCondVar() failed");
            }
        }
        
        void notify() {
            PRStatus status = PR_NotifyCondVar(_cvar);
            if (status != PR_SUCCESS) {
                throw std::runtime_error("PR_NotifyCondVar() failed");
            }
        }
    
    private:
        PRCondVar* _cvar;
    };

}


#endif
