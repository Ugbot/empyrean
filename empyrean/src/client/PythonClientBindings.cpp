#include <boost/python.hpp>
#include "PythonCutScene.h"
using namespace boost::python;


BOOST_PYTHON_MODULE(pyr_client) {
    pyr::bindCutScene();
}
