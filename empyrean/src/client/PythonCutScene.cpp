#include "CutScene.h"
#include "IncludePython.h"
using namespace boost::python;


namespace pyr {

    void bindCutScene() {
        class_<CutScene, CutScenePtr, boost::noncopyable>("CutScene", no_init)
            .def("addImage", &CutScene::addImage)
        ;
    }

}
