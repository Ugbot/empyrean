#include <fstream>
#include <prinrval.h>
#include "Profiler.h"
#include "NSPRUtility.h"

namespace pyr {
    using std::map;
    using std::stack;
    using std::string;
    using std::ofstream;
    using std::endl;

    // Static things.
    float                          Profiler::_lastTime;
    float                          Profiler::_totalTime;
    Profiler::ProcessMap           Profiler::_processes;
    stack<Profiler::Process*>      Profiler::_procHistory;
    
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

        float t = now - _lastTime;
        float tps = now - _startTime;

        _proc->running.time += t;
        _proc->running.timePlusChildren += tps;
        _proc->lastFrame.time += t;
        _proc->lastFrame.timePlusChildren += tps;
        _procHistory.pop();

        _totalTime += now - _lastTime;
        _lastTime = now;
    }

    const Profiler::ProcessMap& Profiler::getProfileInfo() {
        return _processes;
    }

    float Profiler::getTotalTime() {
        return _totalTime;
    }

    void Profiler::dump() {
        if (!_totalTime)    // hack to evade division by zero.  Besides, if _totalTime is zero, then there's nothing to report anyway.
            return;

        ofstream file("profile.html");
        
        file << "<table border=1><tr><th>Process</th><th>Time</th><th>%</th><th>Time+children</th><th>%</th></tr>" << endl;
        for (ProcessMap::iterator i = _processes.begin(); 
            i!=_processes.end(); i++)
        {
            file << "<tr><td>" << i->first << "</td><td>" << i->second.time << "</td><td>" << int(i->second.time*100/_totalTime) << "</td><td>" <<
                i->second.timePlusChildren << "</td><td>" << int(i->second.timePlusChildren*100/_totalTime) << "</tr>" << endl;
        }
        file << "<tr><td>Total</td><td colspan=3>" << _totalTime << "</td><td>100</td></tr></table>" << endl;

        file.close();
    }
};
