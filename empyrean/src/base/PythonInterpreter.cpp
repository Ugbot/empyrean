#include "IncludePython.h"
#include "Log.h"
#include "PythonBindings.h"
#include "PythonInterpreter.h"
using namespace boost;
using namespace boost::python;


namespace pyr {

    namespace {
        Logger& _logger = Logger::get("pyr.PythonInterpreter");
    }

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
            std::string traceback_str;
            if (the<PythonInterpreter>().printTraceBack(traceback, traceback_str)) {
                message += "\n\n";
                message += traceback_str;
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

        // Set sys.path / PYTHONPATH to empty so we can't import modules
        // from the installed copy of Python, if it exists.
        PySys_SetPath("");

        initpyr();

        // Bind a custom object we need for traceback printing support.
        class_< StringWriter, shared_ptr<StringWriter> >("StringWriter")
            .def("write", &StringWriter::write)
            ;
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

    bool PythonInterpreter::printTraceBack(PyObject* tb, std::string& result) {
        shared_ptr<StringWriter> sw(new StringWriter);
        object o(sw);
        PyTraceBack_Print(tb, o.ptr());

        result = sw->contents;
        return true;
    }

}
