#ifndef PYR_PYTHON_INTERPRETER_H
#define PYR_PYTHON_INTERPRETER_H


#include "Singleton.h"


namespace pyr {

    class PythonInterpreter {
        PYR_DECLARE_SINGLETON(PythonInterpreter)

        PythonInterpreter();
        ~PythonInterpreter();

    public:
        
    };

}


#endif
