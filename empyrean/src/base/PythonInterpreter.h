#ifndef PYR_PYTHON_INTERPRETER_H
#define PYR_PYTHON_INTERPRETER_H


#include <vector>
#include <utility>
#include "Error.h"
#include "IncludePython.h"
#include "Singleton.h"


namespace pyr {

    PYR_DEFINE_RUNTIME_ERROR(PythonError);

    std::string getPythonErrorString();
    void checkForPythonError();
    void requirePythonError();

    /**
     * Allows us to check for Python errors at the end of a Python
     * code block whether control left the end of the block or
     * 'return' was used.
     */
    struct PythonCodeErrorSentry {
        ~PythonCodeErrorSentry() {
            if (!std::uncaught_exception()) {
                checkForPythonError();
            }
        }
    };

    #define PYR_NO_UNUSED_WARNING(x) ((void)&(x))

    #define PYR_BEGIN_PYTHON_CODE()                          \
        try {                                                \
            PythonCodeErrorSentry sentry__;                  \
            PYR_NO_UNUSED_WARNING(sentry__);  // silly gcc

    #define PYR_END_PYTHON_CODE()                            \
        }                                                    \
        catch (const boost::python::error_already_set&) {    \
            requirePythonError();                            \
            throw PythonError(getPythonErrorString());       \
        }

    class PythonInterpreter {
        PYR_DECLARE_SINGLETON(PythonInterpreter)

        PythonInterpreter();
        ~PythonInterpreter();

    public:
        void addSubModule(void (*init)());

        /// Generates a unique module in which to run scripts.
        boost::python::object createModule(const std::string& contents,
                                           const std::string& filename);

    private:
        Zeroed<int> _moduleCount;
    };

}


#endif
