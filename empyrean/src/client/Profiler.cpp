#include <fstream>
#include <prinrval.h>
#include "Profiler.h"

namespace pyr {
    using std::map;
    using std::stack;
    using std::string;
    using std::ofstream;
    using std::endl;

    // Static things.
    float                          Profiler::_lastTime;
    float                          Profiler::_totalTime;
    map<string, Profiler::Process> Profiler::_processes;
    stack<Profiler::Process*>      Profiler::_procHistory;
    
    float getNow() {
        return float(PR_IntervalToMicroseconds(PR_IntervalNow())) * 1000000.0f;
    }

    Profiler::Profiler(const string& name) {
        float now = getNow();

        if (_procHistory.empty()) {
            _lastTime = now;
        } else {
            _procHistory.top()->time += now - _lastTime;
            _totalTime += now - _lastTime;
            _lastTime = now;
        }

        _proc = &_processes[name];
        _startTime = now;

        _procHistory.push(_proc);
    }

    Profiler::~Profiler() {
        float now = getNow();

        _proc->time += now - _lastTime;
        _proc->timePlusChildren += now - _startTime;
        _procHistory.pop();

        _totalTime += now - _lastTime;
        _lastTime = now;
    }

    const std::map<std::string,Profiler::Process>& Profiler::getProfileInfo() {
        return _processes;
    }

    void Profiler::dump() {
        if (!_totalTime)    // hack to evade division by zero.  Besides, if _totalTime is zero, then there's nothing to report anyway.
            return;

        ofstream file("profile.html");
        
        file << "<table border=1><tr><th>Process</th><th>Time</th><th>%</th><th>Time+children</th><th>%</th></tr>" << endl;
        for (map<string, Process>::iterator i = _processes.begin(); 
            i!=_processes.end(); i++)
        {
            file << "<tr><td>" << i->first << "</td><td>" << i->second.time << "</td><td>" << int(i->second.time*100/_totalTime) << "</td><td>" <<
                i->second.timePlusChildren << "</td><td>" << int(i->second.timePlusChildren*100/_totalTime) << "</tr>" << endl;
        }
        file << "<tr><td>Total</td><td colspan=3>" << _totalTime << "</td><td>100</td></tr></table>" << endl;

        file.close();
    }
};
