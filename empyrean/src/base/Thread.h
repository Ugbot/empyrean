#ifndef PYR_THREAD_H
#define PYR_THREAD_H


#include <prthread.h>
#include "Mutex.h"


namespace pyr {

    /**
     * Thread-derived classes should not be allocated on the stack.
     * The creator of the thread is responsible for deleting it.
     * While the thread may stop execution, the Thread object will
     * not be destroyed automatically.
     */
    class Thread {
    public:
        /// @throws std::runtime_error if thread cannot be created
        Thread(PRThreadPriority priority = PR_PRIORITY_NORMAL);
        virtual ~Thread();
        
        /**
         * Starts the thread, does nothing if the thread is already
         * started.  The thread calls run().  If the thread creation
         * fails, start() deletes the thread object and throws an
         * exception.
         *
         * @throws std::runtime_error if thread cannot be started.
         */
        void start();
        
        /**
         * Notifies the thread that it should stop execution by setting
         * an internal flag, interrupting blocked calls, and waiting for
         * the thread to finish.
         */
        void stop();
        
        /**
         * Waits for the thread to finish execution.
         */
        void join();
        
        bool isRunning();
        
    protected:
        /// Should be overridden by the deriving class.
        virtual void run() = 0;
        
        bool shouldQuit();
        
    private:
        static void PR_CALLBACK threadRoutine(void* self);
        
        PRThread* _thread;
        bool      _started;  ///< has the thread been started yet?
        PRInt32   _stopped;  ///< has the thread been stopped?
        Mutex     _mutex;    ///< used to implement start()
        PRInt32   _shouldQuit;
    };

}


#endif
