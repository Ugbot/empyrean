#include <fstream>
#include "PythonInterpreter.h"
#include "PythonScript.h"
#include "ResourceManager.h"
using namespace boost::python;


namespace pyr {

    template<>
    class CachePolicy<PythonScript*> {
    public:
        static PythonScript* create(const std::string& id) {
            return new PythonScript(id);
        }

        static void destroy(PythonScript* script) {
            delete script;
        }
    };

    PythonScript* PythonScript::create(const std::string& filename) {
        return the<ResourceManager>().get<PythonScript*>(filename);
    }

    PythonScript::PythonScript(const std::string& filename) {
        std::string line;
        std::ifstream file(filename.c_str());
        while (getline(file, line)) {
            _contents += line + "\n";
        }

        PYR_BEGIN_PYTHON_CODE()
            _module = the<PythonInterpreter>().generateModule();
        PYR_END_PYTHON_CODE()
    }

    void PythonScript::call(const std::string& name, object o) {
        PYR_BEGIN_PYTHON_CODE()

        handle<> main_namespace(borrowed( PyModule_GetDict(_module.get()) ));
        (handle<>( PyRun_String(
            _contents.c_str(),
            Py_file_input,
            main_namespace.get(),
            main_namespace.get()) ));

        object(_module).attr(name.c_str())(o);

        PYR_END_PYTHON_CODE()
    }

}
