#include "CutScene.h"
#include "IncludePython.h"
using namespace boost::python;


namespace pyr {

    void bindCutScene() {
        class_<CutScene, CutScenePtr>("CutScene")
            .def("addImage", &CutScene::addImage)
        ;
    }

}
