#include <boost/python.hpp>
#include "PythonCutScene.h"
using namespace boost::python;


namespace pyr {
    void initClientBindings() {
        bindCutScene();
    }
}


BOOST_PYTHON_MODULE(pyr_client) {
    pyr::initClientBindings();
}
