#include <pratom.h>
#include "CondVar.h"
#include "Debug.h"
#include "Error.h"
#include "Mutex.h"
#include "Thread.h"
#include "ThreadStorage.h"
#include "Log.h"

namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.Thread");

        struct CurrentThread {
            Zeroed<Thread*> thread;
        };
        ThreadStorage<CurrentThread> _currentThread;
    }


    const string& Thread::getCurrentThreadName() {
        static const string mainName("Main");
        Thread* current = _currentThread->thread;
        return current ? current->getName() : mainName;
    }

    Thread* Thread::getCurrentThread() {
        return _currentThread->thread;
    }


    Thread::Thread(
        const string& name,
        Runnable* runnable,
        PRThreadPriority priority)
    : _name(name)
    , _runnable(runnable) {
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
        PYR_LOG_SCOPE(_logger, VERBOSE, "Thread::stop");
        if (!_stopped) {
            _logger.log(VERBOSE, "Setting _shouldQuit flag");
            PR_AtomicSet(&_shouldQuit, 1);
            _logger.log(VERBOSE, "Set _shouldQuit flag");
            if (interrupt) {
                _logger.log(VERBOSE, "Interrupting thread");
                PR_Interrupt(_thread);
                _logger.log(VERBOSE, "Interrupted thread");
            }
            _logger.log(VERBOSE, "Joining thread");
            join();
            _logger.log(VERBOSE, "Joined thread, setting _stopped flag");
            PR_AtomicSet(&_stopped, 1);
            _logger.log(VERBOSE, "Set _stopped flag");
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
            _currentThread->thread = this;
            _runnable->run(this);
        })
        PR_AtomicSet(&_stopped, 1);
    }
    
    void PR_CALLBACK Thread::threadRoutine(void* self) {
        Thread* This = static_cast<Thread*>(self);
        This->threadRoutine();
    }

}
