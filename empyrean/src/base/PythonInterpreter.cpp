#include "IncludePython.h"
#include "PythonBindings.h"
#include "PythonInterpreter.h"
using namespace boost::python;


namespace pyr {

    void checkForPythonError() {
        // We don't use Boost.Python here because it might throw
        // an exception.
        if (PyErr_Occurred()) {
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

            throw PythonError(message.c_str());
        }
    }

    PYR_DEFINE_SINGLETON(PythonInterpreter);

    PythonInterpreter::PythonInterpreter() {
        Py_Initialize();
        initpyr();
    }

    PythonInterpreter::~PythonInterpreter() {
        Py_Finalize();
    }

    void PythonInterpreter::addSubModule(void (*init)()) {
        // We don't have to anything fancier than just call the module
        // initialization function at this time.
        init();
    }

    handle<> PythonInterpreter::createModule(const std::string& contents, const std::string& filename) {
        PYR_BEGIN_PYTHON_CODE()

        handle<> code( Py_CompileString(
            const_cast<char*>(contents.c_str()),
            const_cast<char*>(filename.c_str()),
            Py_file_input) );

        std::string name = va("EmpyreanScript%d", _moduleCount++);
        handle<> module( PyImport_ExecCodeModule(
            const_cast<char*>(name.c_str()),
            code.get()) );

        return module;

        PYR_END_PYTHON_CODE()

        throw PythonError("generateModule() failed");
    }

}
