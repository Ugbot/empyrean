#include "Entity.h"
#include "Map.h"
#include "PhysicsBehaviorSlot.h"
#include "PythonBehavior.h"
#include "PythonInterpreter.h"
#include "PythonScript.h"
using namespace boost;
using namespace boost::python;


namespace pyr {

    PythonBehavior::PythonBehavior(const std::string& resource) {
        _resource = resource;

        PYR_PYTHON_CODE({
            PythonScript* script = PythonScript::create(resource);
            _behavior = script->call("create");

            Behavior* aggregated = extract<Behavior*>(_behavior);
            copySlots(aggregated);
        })
    }


    void PythonBehavior::update(Entity* entity, float dt,
                                const Environment& env) {
        PYR_PYTHON_CODE({
            _behavior.attr("update")(EntityPtr(entity), dt, env);
        })
    }


    class BehaviorWrap : public Behavior {
    public:
        BehaviorWrap(PyObject* self) {
            _self = self;
        }

        /**
         * @{
         * These are only to make BehaviorWrap instantiable.  They shouldn't
         * ever be called.
         */
        std::string getName() {
            PYR_ASSERT(false, "Python called BehaviorWrap::getName().");
            return "";
        }
        std::string getResource() {
            PYR_ASSERT(false, "Python called BehaviorWrap::getResource().");
            return "";
        }
        /// @}

        void update(Entity* entity, float dt, const Environment& env) {
            return call_method<void>(_self, "update", EntityPtr(entity), dt, env);
        }

    private:
        PyObject* _self;
    };


    void bindBehavior() {
        class_<BehaviorSlot, BehaviorSlotPtr, noncopyable>("BehaviorSlot", no_init)
            .def(init<>())
            ;
            
        class_<Action, ActionPtr, noncopyable>("Action", no_init)
            .def(init<>())
            ;

        class_<PhysicsBehaviorSlot, bases<BehaviorSlot>,
               PhysicsBehaviorSlotPtr, noncopyable>("PhysicsBehaviorSlot", no_init)
            .def(init<>())
            ;

        class_<Behavior, RefPtr<BehaviorWrap>, noncopyable>("Behavior", no_init)
            .def(init<>())
            .def("setSlot", &Behavior::setSlot)
            .def("addAction", &Behavior::addAction)
            ;

        class_<Map>("Map")
            ;

        class_<Environment>("Environment", no_init)
            .def_readonly("map",      &Environment::map)
            .def_readonly("entities", &Environment::entities)
            ;

        // Perhaps this should go into a bindEntity() function somewhere else.
        class_<Entity, EntityPtr, noncopyable>("Entity", no_init)
			.def("setPos", &setPos)
			.def("setVel", &setVel)
			.def("getPosX", &getPosX)
			.def("getVelX", &getVelX)
            ;
    }

	void setPos(Entity* entity, float x, float y) {
		entity->setPos(Vec2f(x, y));
	}

	void setVel(Entity* entity, float x, float y) {
		entity->setVel(Vec2f(x, y));
	}

	float getPosX(Entity* entity) {
		return (entity->getVel()[0]);
	}

	float getVelX(Entity* entity) {
		return (entity->getPos()[0]);
	}

}
