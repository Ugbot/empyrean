#include <fstream>

#include "Profiler.h"
#include "SDL.h"

namespace pyr {
    using std::map;
    using std::stack;
    using std::string;
    using std::ofstream;
    using std::endl;

    // Static things.
    int                             Profiler::_lasttime;
    int                             Profiler::_totaltime;
    map<string,Profiler::Process>   Profiler::_processes;
    stack<Profiler::Process*>       Profiler::_prochistory;

    Profiler::Profiler(const string& name) {
        int ticks=SDL_GetTicks();

        if (_prochistory.empty()) {
            _lasttime=ticks;
        }
        else {
            _prochistory.top()->time += ticks - _lasttime;
            _totaltime += ticks - _lasttime;
            _lasttime = ticks;
        }

        _proc = &_processes[name];
        _starttime = ticks;

        _prochistory.push(_proc);
    }

    Profiler::~Profiler() {
        int ticks=SDL_GetTicks();

        _proc->time += ticks - _lasttime;
        _proc->timepluschildren += ticks - _starttime;
        _prochistory.pop();

        _totaltime += ticks - _lasttime;
        _lasttime = ticks;
    }

    const std::map<std::string,Profiler::Process>& Profiler::getProfileInfo() {
        return _processes;
    }

    void Profiler::dump() {
        ofstream file("profile.html");
        
        file << "<table><tr><th>Process</th><th>Time</th><th>Time+children</th></tr>" << endl;
        for (map<string,Process>::iterator i=_processes.begin(); 
            i!=_processes.end(); i++)
        {
            file << "<tr><td>" << i->first << "</td><td>" << i->second.time << "</td><td>" 
                << i->second.timepluschildren << "</td></tr>" << endl;
        }
        file << "<tr><td>Total</td><td colspan=2>" << _totaltime << "</td></tr></table>" << endl;

        file.close();
    }
};