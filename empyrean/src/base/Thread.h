#ifndef PYR_THREAD_H
#define PYR_THREAD_H


#include <SDL.h>


namespace pyr {

    class Thread {
    public:
        Thread();
        virtual ~Thread() { }
    
        virtual void run() = 0;
        
    private:
        static int threadRoutine(void* self);
        
    };

}


#endif
