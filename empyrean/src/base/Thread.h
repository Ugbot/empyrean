#ifndef PYR_THREAD_H
#define PYR_THREAD_H


#include "IncludeNSPR.h"
#include "ScopedPtr.h"
#include "Types.h"


namespace pyr {

    class Thread;
    
    /// Your thread class should implement this interface.
    class Runnable {
    public:
        virtual ~Runnable() { }

        /**
         * The 'thread' argument could be replaced by
         * Thread::getCurrentThread...
         */
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
        /**
         * Returns a pointer to the Thread object representing the current
         * thread.  If the current thread was created by means of something
         * other than this class (such as the main thread), returns 0.
         */
        static Thread* getCurrentThread();

        /**
         * Returns the name of the current thread.  If the current thread was
         * created by something other than this class, returns "Main".
         */
        static const string& getCurrentThreadName();


        /// @throws std::runtime_error if thread cannot be created
        Thread(const string& name,
               Runnable* runnable,
               PRThreadPriority priority = PR_PRIORITY_NORMAL);
        ~Thread();

        const string& getName() const {
            return _name;
        }
        
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

        string _name;
        
        ScopedPtr<Runnable> _runnable;
        
        PRThread* _thread;
        PRInt32   _stopped;  ///< has the thread been stopped?

        PRInt32   _shouldQuit;
    };

}


#endif
