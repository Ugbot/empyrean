#include "IncludePython.h"
#include "PythonBehavior.h"
#include "PythonGMTL.h"
#include "PythonLog.h"
using namespace boost::python;


namespace pyr {
    void initBindings() {
        bindBehavior();
        bindGMTL();
        bindLog();
    }
}


BOOST_PYTHON_MODULE(pyr) {
    pyr::initBindings();
}
