#include <iostream>
#include <pratom.h>
#include "CondVar.h"
#include "Debug.h"
#include "Error.h"
#include "Mutex.h"
#include "Thread.h"


namespace pyr {

    Thread::Thread(PRThreadPriority priority) {
        PR_AtomicSet(&_shouldQuit, 0);
        _started = false;
        _stopped = 0;
        
        _mutex = new Mutex;
        _threadStarted = new CondVar(_mutex);

        _thread = PR_CreateThread(
            PR_USER_THREAD,
            threadRoutine,
            this,
            priority,
            PR_GLOBAL_THREAD,
            PR_JOINABLE_THREAD,
            0);

        if (!_thread) {
            delete _threadStarted;
            delete _mutex;
            throwNSPRError("PR_CreateThread() failed");
        }
    }
    
    Thread::~Thread() {
        delete _threadStarted;
        delete _mutex;
        PYR_ASSERT(
            !_started || _stopped,
            "Thread must be stopped before ~Thread() is called.\n"
            "Put a call to stop() in your thread's destructor.");
    }
    
    void Thread::start() {
        if (!_started) {
            _mutex->lock();
            _started = true;
            _threadStarted->notify();
            _mutex->unlock();
        }
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
        return (_started && !_stopped);
    }
    
    bool Thread::shouldQuit() {
        return (_shouldQuit != 0);
    }
    
    void PR_CALLBACK Thread::threadRoutine(void* self) {
        Thread* This = static_cast<Thread*>(self);
        try {
            This->_mutex->lock();
            while (!This->_started) {
                This->_threadStarted->wait();
            }
            This->_mutex->unlock();
            
            This->run();
        }
        catch (const std::exception& e) {
            error("Caught exception: " + std::string(e.what()));
        }
        PR_AtomicSet(&This->_stopped, 1);
    }

}
