#ifndef PYR_PYTHON_INTERPRETER_H
#define PYR_PYTHON_INTERPRETER_H


#include <vector>
#include <utility>
#include "Error.h"
#include "IncludePython.h"
#include "Singleton.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(PythonError);

    /// This helps clean up the PYR_END_PYTHON_CODE() macro.
    void checkForPythonError();

    #define PYR_BEGIN_PYTHON_CODE()                                                     \
        try {

    #define PYR_END_PYTHON_CODE()                                                       \
        }                                                                               \
        catch (const boost::python::error_already_set&) {                               \
            if (!PyErr_Occurred()) {                                                    \
                throw PythonError("Boost.Python exception, but no Python error set.");  \
            }                                                                           \
        }                                                                               \
        checkForPythonError();

    class PythonInterpreter {
        PYR_DECLARE_SINGLETON(PythonInterpreter)

        PythonInterpreter();
        ~PythonInterpreter();

    public:
        void addSubModule(void (*init)());

        /// Generates a unique module in which to run scripts.
        boost::python::handle<> createModule(const std::string& contents,
                                             const std::string& filename);

    private:
        Zeroed<int> _moduleCount;
    };

}


#endif
