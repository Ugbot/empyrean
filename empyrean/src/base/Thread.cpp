#include <iostream>
#include <pratom.h>
#include "CondVar.h"
#include "Debug.h"
#include "Error.h"
#include "Mutex.h"
#include "Thread.h"


namespace pyr {

    void Runnable::setThread(Thread* thread) {
        _thread = thread;
    }
        
    bool Runnable::shouldQuit() {
        return (_thread ? _thread->shouldQuit() : true);
    }
    
    Thread::Thread(Runnable* runnable, PRThreadPriority priority) {
        _object = runnable;
        _object->setThread(this);
    
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
            PR_AtomicSet(&_shouldQuit, 1);
            if (interrupt) {
                PR_Interrupt(_thread);
            }
            join();
            PR_AtomicSet(&_stopped, 1);
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
        PYR_BEGIN_EXCEPTION_TRAP()
        _object->run();
        PYR_END_EXCEPTION_TRAP()
        PR_AtomicSet(&_stopped, 1);
    }
    
    void PR_CALLBACK Thread::threadRoutine(void* self) {
        Thread* This = static_cast<Thread*>(self);
        This->threadRoutine();
    }

}
