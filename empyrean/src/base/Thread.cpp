#include <iostream>
#include <pratom.h>
#include "Error.h"
#include "Thread.h"


namespace pyr {

    Thread::Thread(PRThreadPriority priority) {
        PR_AtomicSet(&_shouldQuit, 0);
        _started = false;
        _stopped = 0;
        _mutex.lock();

        _thread = PR_CreateThread(
            PR_USER_THREAD,
            threadRoutine,
            this,
            priority,
            PR_GLOBAL_THREAD,
            PR_JOINABLE_THREAD,
            0);

        if (!_thread) {
            throw std::runtime_error("PR_CreateThread() failed");
        }
    }
    
    Thread::~Thread() {
        if (_started && !_stopped) {
            stop();
        }
    }
    
    void Thread::start() {
        if (!_started) {
            _started = true;
            _mutex.unlock();
        }
    }
    
    void Thread::stop() {
        if (!_stopped) {
            PR_AtomicSet(&_shouldQuit, 1);
            PR_Interrupt(_thread);
            join();
            PR_AtomicSet(&_stopped, 1);
        }
    }
    
    void Thread::join() {
        PRStatus status = PR_JoinThread(_thread);
        if (status != PR_SUCCESS) {
            throw std::runtime_error("PR_JoinThread failed");
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
            This->run();
        }
        catch (const std::exception& e) {
            error("Caught exception: " + std::string(e.what()));
        }
        PR_AtomicSet(&This->_stopped, 1);
    }

}
