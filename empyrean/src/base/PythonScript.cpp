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

        PYR_PYTHON_CODE({
            _module = the<PythonInterpreter>().createModule(contents, filename);
        })
    }

    object PythonScript::call(const std::string& name) {
        PYR_PYTHON_CODE({
            return _module.attr(name.c_str())();
        })
    }

    object PythonScript::call(const std::string& name, object o) {
        PYR_PYTHON_CODE({
            return _module.attr(name.c_str())(o);
        })
    }

}
