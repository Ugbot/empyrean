#ifndef PYR_PROFILER_H
#define PYR_PROFILER_H

#include <map>
#include <stack>
#include <string>

namespace pyr {
    using std::map;
    using std::stack;
    using std::string;

    /** A Simple class for figuring out what's going on when, and for how long.
     * 
     * This is a bit goofy, but I'll try to explain anyway.  _lastTime is the time
     * at which the last Process transition occured.  Any time a Profiler is created
     * or destroyed, it's updated.  When a new profiler is created, the old Process's
     * time is updated before it's reset. (time spent in that process, not child
     * Processes) When all the child states are done, and the Profiler is being
     * destroyed, it holds the time at which the last child process terminated,
     * (so once more, we get the time spent in the process, and not its children)
     *
     * _lastTime is much simpler.  It holds the time the Profiler was born at.
     * So, when the Profiler is destroyed, we know how much time was spent in the
     * Process, as well as all child processes spawned.
     *
     * _totalTime is the easiest.  Before we nuke the value of _lastTime, we add it
     * into _totalTime.
     */
    class Profiler {
    public:
        struct Process
        {
            int time;                               //!< Time spent in this process, in milliseconds.
            int timepluschildren;                   //!< Time spent in this process, and in processes spawned by it. (also in milliseconds)
            Process()
                : time(0), timepluschildren(0) {
            }
        };

    private:
        Process* _proc;                             //!< The process we're tracking right now.
        int _starttime;                             //!< The time at which this object was created.

        static int _lastTime;                       //!< Time since the last process transition
        static int _totalTime;                      //!< Total number of ticks elapsed with profiling on
        static map<string,Process> _processes;      //!< Tallied up times for all started processes.
        static stack<Process*>     _procHistory;    //!< "call stack"

    public:
        Profiler(const string& name);
        ~Profiler();

        //! Accessor for gathered profiling information.
        static const map<string,Process>& getProfileInfo();

        //! Dumps the profiling information to a file named profile.html
        static void dump();
    };

};

#define PYR_ENABLE_PROFILE

#ifdef PYR_ENABLE_PROFILE
#   define PYR_PROFILE_BLOCK(x) ::pyr::Profiler _profileitbaby(x)
#else
#   define PYR_PROFILE_BLOCK(x)
#endif

#endif