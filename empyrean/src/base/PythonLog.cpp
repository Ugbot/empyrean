#include <boost/python.hpp>
#include "Log.h"
using namespace boost::python;


namespace pyr {

    void bindLog() {
        def("log", writeLog);
    }

}
