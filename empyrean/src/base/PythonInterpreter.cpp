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

        std::string message = "Python error: ";
        if (type) {
            if (PyObject* type_str = PyObject_Str(type)) {
                message += PyString_AsString(type_str);
                Py_DECREF(type_str);
            }
            Py_DECREF(type);
        }
        if (value) {
            if (PyObject* value_str = PyObject_Str(value)) {
                message += ": ";
                message += PyString_AsString(value_str);
                Py_DECREF(value_str);
            }
            Py_DECREF(value);
        }
        if (traceback) {
            // Since we're using Boost.Python, don't let it throw exceptions
            // here.
            try {
                boost::python::str StringIOName("StringIO");
                object StringIOModule((handle<>(
                    PyImport_Import( PyObject_Str(StringIOName.ptr()) )
                )));
                object StringIOClass(StringIOModule.attr("StringIO"));
                object stringFile(StringIOClass());
                PyTraceBack_Print(traceback, stringFile.ptr());
                boost::python::str traceback_str(stringFile.attr("getvalue")());
                message += "\n\n";
                message += PyString_AsString(traceback_str.ptr());
            }
            catch (const std::exception&) {
            }
            catch (const error_already_set&) {
            }
            Py_DECREF(traceback);
        }

        return message;
    }

    void checkForPythonError() {
        if (PyErr_Occurred()) {
            throw PythonError(getPythonErrorString());
        }
    }

    void requirePythonError() {
        if (!PyErr_Occurred()) {
            throw PythonError("Boost.Python exception, but no Python error set.");
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
        PYR_PYTHON_CODE({
            handle<> code( Py_CompileString(
                const_cast<char*>(contents.c_str()),
                const_cast<char*>(filename.c_str()),
                Py_file_input) );

            std::string name = va("EmpyreanScript%d", _moduleCount++);
            handle<> module( PyImport_ExecCodeModule(
                const_cast<char*>(name.c_str()),
                code.get()) );

            return object(module);
        })
    }

}
