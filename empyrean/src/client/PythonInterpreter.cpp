#include "IncludePython.h"
#include "PythonInterpreter.h"


extern "C" void initpyr();

        
namespace pyr {

    PYR_DEFINE_SINGLETON(PythonInterpreter);

    PythonInterpreter::PythonInterpreter() {
        Py_Initialize();

        // Register pyr module.
        initpyr();
    }

    PythonInterpreter::~PythonInterpreter() {
        Py_Finalize();
    }

}
