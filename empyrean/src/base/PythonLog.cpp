#include "IncludePython.h"
#include "Log.h"
using namespace boost;
using namespace boost::python;


namespace pyr {

    class PythonLogger {
    public:
        PythonLogger(const string& name) {
            _logger = &Logger::get(name);
        }

        void log(LogLevel level, const string& message) {
            _logger->log(level, message);
        }

    private:
        Logger* _logger;
    };

    void bindLog() {
        enum_<LogLevel>("LogLevel")
            .value("ALL",     ALL)
            .value("VERBOSE", VERBOSE)
            .value("INFO",    INFO)
            .value("WARN",    WARN)
            .value("ERROR",   ERROR)
            .value("FATAL",   FATAL)
            .value("OFF",     OFF)
            ;

        class_<PythonLogger>("Logger", no_init)
            .def(init<string>())
            .def("log", &PythonLogger::log)
            ;
    }

}
