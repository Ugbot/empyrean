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
    int                             Profiler::_lastTime;
    int                             Profiler::_totalTime;
    map<string, Profiler::Process>  Profiler::_processes;
    stack<Profiler::Process*>       Profiler::_procHistory;

    Profiler::Profiler(const string& name) {
        int ticks = SDL_GetTicks();

        if (_procHistory.empty()) {
            _lastTime = ticks;
        }
        else {
            _procHistory.top()->time += ticks - _lastTime;
            _totalTime += ticks - _lastTime;
            _lastTime = ticks;
        }

        _proc = &_processes[name];
        _startTime = ticks;

        _procHistory.push(_proc);
    }

    Profiler::~Profiler() {
        int ticks = SDL_GetTicks();

        _proc->time += ticks - _lastTime;
        _proc->timePlusChildren += ticks - _startTime;
        _procHistory.pop();

        _totalTime += ticks - _lastTime;
        _lastTime = ticks;
    }

    const std::map<std::string,Profiler::Process>& Profiler::getProfileInfo() {
        return _processes;
    }

    void Profiler::dump() {
        ofstream file("profile.html");
        
        file << "<table><tr><th>Process</th><th>Time</th><th>Time+children</th></tr>" << endl;
        for (map<string, Process>::iterator i = _processes.begin(); 
            i!=_processes.end(); i++)
        {
            file << "<tr><td>" << i->first << "</td><td>" << i->second.time << "</td><td>" 
                << i->second.timePlusChildren << "</td></tr>" << endl;
        }
        file << "<tr><td>Total</td><td colspan=2>" << _totalTime << "</td></tr></table>" << endl;

        file.close();
    }
};
