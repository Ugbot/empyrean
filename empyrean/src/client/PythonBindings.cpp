#include <boost/python.hpp>
using namespace boost::python;


namespace pyr {
    void bindCutScene();
    void bindLog();
}


BOOST_PYTHON_MODULE(pyr) {
    pyr::bindCutScene();
    pyr::bindLog();
}
