#ifndef PYR_PYTHON_BEHAVIOR_H
#define PYR_PYTHON_BEHAVIOR_H


#include "Behavior.h"
#include "IncludePython.h"


namespace pyr {

    class PythonBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("python");

        PythonBehavior(const std::string& resource);

        void update(Entity* entity, float dt, const Environment& env);

        std::string getResource() {
            return _resource;
        }

    private:
        std::string _resource;
        boost::python::object _behavior;
    };


    void bindBehavior();

}


#endif
