#include "IncludePython.h"
#include "PythonBindings.h"
#include "PythonInterpreter.h"
using namespace boost::python;


namespace pyr {

    // We don't use Boost.Python in these because it might throw
    // an exception.

    std::string getPythonErrorString() {
        // Extra paranoia...
        if (!PyErr_Occurred()) {
            return "No Python error";
        }

        PyObject *type, *value, *traceback;
        PyErr_Fetch(&type, &value, &traceback);
        PyErr_Clear();

        std::string message = "Python error: ";
        if (type) {
            type = PyObject_Str(type);
            message += PyString_AsString(type);
        }
        if (value) {
            value = PyObject_Str(value);
            message += ": ";
            message += PyString_AsString(value);
        }
        Py_XDECREF(type);
        Py_XDECREF(value);
        Py_XDECREF(traceback);

        return message;
    }

    void checkForPythonError() {
        if (PyErr_Occurred()) {
            throw PythonError(getPythonErrorString());
        }
    }

    void requirePythonError() {
        if (!PyErr_Occurred()) {
            throw PythonError("Boost.Python exception, "
                              "but no Python error set.");
        }
    }

    PYR_DEFINE_SINGLETON(PythonInterpreter);

    PythonInterpreter::PythonInterpreter() {
        Py_Initialize();
        initpyr();
    }

    PythonInterpreter::~PythonInterpreter() {
        // Hm, apparently Boost.Python doesn't play nicely with Py_Finalize.
        //Py_Finalize();
    }

    void PythonInterpreter::addSubModule(void (*init)()) {
        // We don't have to anything fancier than just call the module
        // initialization function at this time.
        init();
    }

    object PythonInterpreter::createModule(const std::string& contents,
                                           const std::string& filename) {
        PYR_BEGIN_PYTHON_CODE()

        handle<> code( Py_CompileString(
            const_cast<char*>(contents.c_str()),
            const_cast<char*>(filename.c_str()),
            Py_file_input) );

        std::string name = va("EmpyreanScript%d", _moduleCount++);
        handle<> module( PyImport_ExecCodeModule(
            const_cast<char*>(name.c_str()),
            code.get()) );

        return object(module);

        PYR_END_PYTHON_CODE()
    }

}
