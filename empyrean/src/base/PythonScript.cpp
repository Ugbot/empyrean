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
        std::string contents, line;
        std::ifstream file(filename.c_str());
        while (getline(file, line)) {
            contents += line + "\n";
        }

        PYR_BEGIN_PYTHON_CODE()
            _module = the<PythonInterpreter>().createModule(contents, filename);
        PYR_END_PYTHON_CODE()
    }

    object PythonScript::call(const std::string& name) {
        PYR_BEGIN_PYTHON_CODE()
            return _module.attr(name.c_str())();
        PYR_END_PYTHON_CODE()
    }

    object PythonScript::call(const std::string& name, object o) {
        PYR_BEGIN_PYTHON_CODE()
            return _module.attr(name.c_str())(o);
        PYR_END_PYTHON_CODE()
    }

}
