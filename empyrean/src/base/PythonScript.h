#ifndef PYR_PYTHON_SCRIPT_H
#define PYR_PYTHON_SCRIPT_H


#include "IncludePython.h"


namespace pyr {

    class PythonScript {
    public:
        typedef boost::python::object object;

        static PythonScript* create(const std::string& filename);

        PythonScript(const std::string& filename);

        object getModule() {
            return _module;
        }

        object call(const std::string& name);

        template<typename T>
        object call(const std::string& name, const T& t) {
            return call(name, object(t));
        }

        // Add call() overloads for multiple parameters if necessary.

    private:
        object call(const std::string& name, object o);

        object _module;
    };

}


#endif
