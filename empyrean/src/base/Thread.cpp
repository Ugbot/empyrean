#include <pratom.h>
#include "CondVar.h"
#include "Debug.h"
#include "Error.h"
#include "Mutex.h"
#include "Thread.h"
#include "Log.h"

namespace pyr {

    Thread::Thread(Runnable* runnable, PRThreadPriority priority) {
        _runnable = runnable;
    
        PR_AtomicSet(&_shouldQuit, 0);
        _stopped = 0;
        
        _thread = PR_CreateThread(
            PR_USER_THREAD,
            threadRoutine,
            this,
            priority,
            PR_GLOBAL_THREAD,
            PR_JOINABLE_THREAD,
            0);

        if (!_thread) {
            throwNSPRError("PR_CreateThread() failed");
        }
    }
    
    Thread::~Thread() {
        stop();
    }
    
    void Thread::stop(bool interrupt) {
        if (!_stopped) {
            writeLog("Stop line 1");
            PR_AtomicSet(&_shouldQuit, 1);
            writeLog("Stop line 2");
            if (interrupt) {
                writeLog("Stop line 3");
                PR_Interrupt(_thread);
                writeLog("Stop line 4");
            }
            writeLog("Stop line 5");
            join();
            writeLog("Stop line 6");
            PR_AtomicSet(&_stopped, 1);
            writeLog("Stop line 7");
        }
    }
    
    void Thread::join() {
        PRStatus status = PR_JoinThread(_thread);
        if (status != PR_SUCCESS) {
            throwNSPRError("PR_JoinThread failed");
        }
    }
    
    bool Thread::isRunning() {
        return (!_stopped);
    }
    
    bool Thread::shouldQuit() {
        return (_shouldQuit != 0);
    }
    
    void Thread::threadRoutine() {
        PYR_EXCEPTION_TRAP({
            _runnable->run(this);
        })
        PR_AtomicSet(&_stopped, 1);
    }
    
    void PR_CALLBACK Thread::threadRoutine(void* self) {
        Thread* This = static_cast<Thread*>(self);
        This->threadRoutine();
    }

}
