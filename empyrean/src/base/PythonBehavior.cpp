#include "Entity.h"
#include "PythonBehavior.h"
#include "PythonInterpreter.h"
#include "PythonScript.h"
using namespace boost::python;


namespace pyr {

    PythonBehavior::PythonBehavior(const std::string& resource) {
        _resource = resource;

        PYR_BEGIN_PYTHON_CODE()
            PythonScript* script = PythonScript::create(resource);
            _module = script->getModule();
        PYR_END_PYTHON_CODE()
    }


    void PythonBehavior::update(Entity* entity, float dt,
                                const Environment& env) {
        PYR_BEGIN_PYTHON_CODE()
            _module.attr("update")(EntityPtr(entity), dt, env);
        PYR_END_PYTHON_CODE()
    }


    void bindBehavior() {
        class_<Environment>("Environment")
            .def_readonly("map",      &Environment::map)
            .def_readonly("entities", &Environment::entities);

        // Perhaps this should go into a bindEntity() function somewhere else.
        class_<Entity, EntityPtr, boost::noncopyable>("Entity", no_init)
            ;
    }

}
