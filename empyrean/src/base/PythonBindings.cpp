#include <boost/python.hpp>
#include "PythonInterpreter.h"
#include "PythonLog.h"
using namespace boost::python;


BOOST_PYTHON_MODULE(pyr) {
    using namespace pyr;

    bindLog();

    the<PythonInterpreter>().initializeSubModules();
}
