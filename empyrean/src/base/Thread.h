#ifndef PYR_THREAD_H
#define PYR_THREAD_H


#include <prthread.h>
#include "ScopedPtr.h"


namespace pyr {

    class Thread;
    
    /// Your thread class should implement this interface.
    class Runnable {
    public:
        virtual ~Runnable() { }
        virtual void run(Thread* thread) = 0;
    };

    /**
     * Thread objects should not be allocated on the stack.
     * The creator of the thread is responsible for deleting it.
     * While the thread may stop execution, the Thread object will
     * not be destroyed automatically.
     *
     * Thread takes ownership of the Runnable passed to it, and deletes
     * it when the Thread object itself is destroyed.
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
        
        /// Waits for the thread to finish execution.
        void join();
        
        bool isRunning();
        
        /**
         * Intended for use within Runnable::run implementations.  A thread
         * should periodically poll whether it should end.
         */
        bool shouldQuit();

    private:
        void threadRoutine();
        static void PR_CALLBACK threadRoutine(void* self);
        
        ScopedPtr<Runnable> _runnable;
        
        PRThread* _thread;
        PRInt32   _stopped;  ///< has the thread been stopped?

        PRInt32   _shouldQuit;
    };

}


#endif
