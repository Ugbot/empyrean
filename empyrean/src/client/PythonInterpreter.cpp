#include "IncludePython.h"
#include "PythonInterpreter.h"
using namespace boost::python;


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

    handle<> PythonInterpreter::generateModule() {
        PYR_BEGIN_PYTHON_CODE()

        std::string name = va("EmpyreanScript%d", _moduleCount++);
        handle<> module( PyModule_New(const_cast<char*>(name.c_str())) );
        return module;

        PYR_END_PYTHON_CODE()

        throw PythonError("generateModule() failed");
    }

}
