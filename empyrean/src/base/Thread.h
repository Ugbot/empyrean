#ifndef PYR_THREAD_H
#define PYR_THREAD_H


#include <prthread.h>
#include "Utility.h"


namespace pyr {

    class Thread;
    
    /**
     * Your class should implement this interface.
     */
    class Runnable {
    public:
        virtual ~Runnable() { }
        virtual void run() = 0;
        
        void setThread(Thread* thread);
        bool shouldQuit();
        
    private:
        Thread* _thread;
    };

    /**
     * Thread objects should not be allocated on the stack.
     * The creator of the thread is responsible for deleting it.
     * While the thread may stop execution, the Thread object will
     * not be destroyed automatically.
     *
     * *NOTE* Your derived thread's destructor should call stop() before it
     * does any cleanup.
     */
    class Thread {
    public:
        /// @throws std::runtime_error if thread cannot be created
        Thread(Runnable* runnable, PRThreadPriority priority = PR_PRIORITY_NORMAL);
        ~Thread();
        
        /**
         * Notifies the thread that it should stop execution by setting
         * an internal flag, interrupting blocked calls, and waiting for
         * the thread to finish.
         *
         * @param interrupt  If this is true, the thread sends an interrupt
         *                   event, breaking out of blocking I/O calls.
         */
        void stop(bool interrupt = false);
        
        /**
         * Waits for the thread to finish execution.
         */
        void join();
        
        bool isRunning();
        
        bool shouldQuit();

    private:
        void threadRoutine();
        static void PR_CALLBACK threadRoutine(void* self);
        
        ScopedPtr<Runnable> _object;
        
        PRThread* _thread;
        PRInt32   _stopped;  ///< has the thread been stopped?

        PRInt32   _shouldQuit;
    };

}


#endif
