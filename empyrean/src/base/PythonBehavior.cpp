#include <boost/python/suite/indexing/vector_indexing_suite.hpp>
#include "Entity.h"
#include "Environment.h"
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
            copyActions(aggregated);
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
        string getName() {
            PYR_ASSERT(false, "Python called BehaviorWrap::getName().");
            return "";
        }
        string getResource() {
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
    PYR_REF_PTR(BehaviorWrap);


    void setPos(Entity* entity, const Vec2f& pos) {
        entity->setPos(pos);
    }
    Vec2f getPos(Entity* entity) {
        return entity->getPos();
    }

    void setVel(Entity* entity, const Vec2f& vel) {
        entity->setVel(vel);
    }
    Vec2f getVel(Entity* entity) {
        return entity->getVel();
    }

    MapPtr getMap(const Environment& env) {
        return env.map;
    }

    list getEntities(const Environment& env) {
        list rv;
        for (size_t i = 0; i < env.entities.size(); ++i) {
            EntityPtr e = env.entities[i].get();
            rv.append(e);
        }
        return rv;
    }

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
            .def_readwrite("desiredAccel",       &PhysicsBehaviorSlot::desiredAccel)
            .def_readwrite("groundDir",          &PhysicsBehaviorSlot::groundDir)
            .def_readwrite("facingRight",        &PhysicsBehaviorSlot::facingRight)
            .def_readwrite("desiredGroundSpeed", &PhysicsBehaviorSlot::desiredGroundSpeed)
            ;

        class_<Behavior, BehaviorWrap, noncopyable>("Behavior", no_init)
            .def(init<>())
            .def("setSlot", &Behavior::setSlot)
            .def("addAction", &Behavior::addAction)
            .add_property("name", &Behavior::getName)
            ;
        register_ptr_to_python<BehaviorPtr>();

        class_<Map, MapPtr, noncopyable>("Map", no_init)
            ;

        // Perhaps this should go into a bindEntity() function somewhere else.
        class_<Entity, EntityPtr, noncopyable>("Entity", no_init)
            .add_property("behavior",   &Entity::getBehavior)
            .add_property("appearance", &Entity::getAppearance)
            .add_property("pos", &getPos, &setPos)
            .add_property("vel", &getVel, &setVel)
            .def("sendAppearanceCommand", &Entity::sendAppearanceCommand)
            .def("beginAnimationCycle",   &Entity::beginAnimationCycle)
            .def("beginAnimation",        &Entity::beginAnimation)
            ;

        //class_<EntityList>("EntityList")
        //    .def(vector_indexing_suite<EntityList>())
        //    ;

        class_<Environment>("Environment", no_init)
            .add_property("map",      &getMap)
            .add_property("entities", &getEntities)
            ;
    }

}
