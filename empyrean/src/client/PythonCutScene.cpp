#include <boost/python.hpp>
#include "CutScene.h"
using namespace boost::python;


namespace pyr {

    void bindCutScene() {
        class_<CutScene, CutScenePtr>("CutScene")
            .def("addImage", &CutScene::addImage)
        ;
    }

}
