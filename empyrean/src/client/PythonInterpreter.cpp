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
