#include <Python.h>
#include "PythonInterpreter.h"


namespace pyr {

    PYR_DEFINE_SINGLETON(PythonInterpreter);

    PythonInterpreter::PythonInterpreter() {
        Py_Initialize();
    }

    PythonInterpreter::~PythonInterpreter() {
        Py_Finalize();
    }

}
