#ifndef PYR_BEHAVIOR_H
#define PYR_BEHAVIOR_H


#include <string>


namespace pyr {

    class Entity;

    
    /**
     * An object that can control an entity's motion and actions.
     */
    class Behavior {
    public:
        virtual ~Behavior() { }
        virtual const char* getName() = 0;
        virtual const char* getResource() = 0;
        virtual void update(Entity* entity, float dt) = 0;
    };

    /**
     * Instantiates a behavior from the type 'name'.  Returns a default (naive)
     * implementation of a behavior if the name isn't understood.
     *
     * This function will not return a null pointer.
     */
    Behavior* instantiateBehavior(const std::string& name,
                                  const std::string& resource = "");

}

#endif
