#include <boost/python.hpp>
#include "PythonLog.h"
using namespace boost::python;


namespace pyr {
    void initBindings() {
        bindLog();
    }
}


BOOST_PYTHON_MODULE(pyr) {
    pyr::initBindings();
}
