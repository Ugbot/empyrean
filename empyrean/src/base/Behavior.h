#ifndef PYR_BEHAVIOR_H
#define PYR_BEHAVIOR_H


#include <string>


namespace pyr {

    class Entity;
    class Map;

#define PYR_BEHAVIOR_NAME(name)             \
    const char* getName() {                 \
        return getClassName();              \
    }                                       \
    static const char* getClassName() {     \
        return (name);                      \
    }
    
    /**
     * An object that can control an entity's motion and actions.
     */
    class Behavior {
    public:
        virtual ~Behavior() { }
        // Should getName() and getResource() return std::string instead?
        // It gets rid of the null pointer issue.
        virtual const char* getName() = 0;
        virtual const char* getResource() = 0;
        virtual void update(Entity* entity, float dt, const Map* map) = 0;
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
