#include "IncludePython.h"
#include "PythonBehavior.h"
#include "PythonLog.h"
using namespace boost::python;


namespace pyr {
    void initBindings() {
	bindBehavior();
        bindLog();
    }
}


BOOST_PYTHON_MODULE(pyr) {
    pyr::initBindings();
}
