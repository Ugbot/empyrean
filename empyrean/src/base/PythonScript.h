#ifndef PYR_PYTHON_SCRIPT_H
#define PYR_PYTHON_SCRIPT_H


#include "IncludePython.h"


namespace pyr {

    class PythonScript {
    public:
        static PythonScript* create(const std::string& filename);

        PythonScript(const std::string& filename);

        template<typename T>
        void call(const std::string& name, const T& t) {
            call(name, boost::python::object(t));
        }

        // Add call() overloads for multiple parameters if necessary.

    private:
        void call(const std::string& name, boost::python::object o);

        boost::python::handle<> _module;
    };

}


#endif
