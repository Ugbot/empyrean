#ifndef PYR_THREAD_STORAGE_H
#define PYR_THREAD_STORAGE_H


#include "NSPRUtility.h"


namespace pyr {

    template<typename T>
    class ThreadStorage {
    public:
        ThreadStorage() {
            PRStatus status = PR_NewThreadPrivateIndex(&_index, dtor);
            if (status != PR_SUCCESS) {
                throwNSPRError("PR_NewThreadPrivateIndex failed");
            }
        }
        
        operator T&() const {
            return *get();
        }
        
        T* operator->() const {
            return get();
        }

        T* get() const {        
            void* data = PR_GetThreadPrivate(_index);
            if (!data) {
                data = new T;
                PR_SetThreadPrivate(_index, data);
            }
            T* t = static_cast<T*>(data);
            PYR_ASSERT(t, "ThreadData should be non-null.");
            return t;
        }
        
    private:
        static void PR_CALLBACK dtor(void* data) {
            T* t = static_cast<T*>(data);
            delete t;
        }
        
        PRUintn _index;
    };

}


#endif
