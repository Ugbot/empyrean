#ifndef PYR_BEHAVIOR_H
#define PYR_BEHAVIOR_H


#include <string>


namespace pyr {

    class Appearance;
    class Entity;
    class Map;

#define PYR_BEHAVIOR_NAME(name)             \
    const std::string getName() {                 \
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
        virtual const std::string getName() = 0;
        virtual const std::string getResource() = 0;
        virtual void update(Entity* entity, float dt, const Map* map) = 0;

    protected:
        void sendAppearanceCommand(Entity* entity, const std::string& command);
        void beginAnimationCycle(Entity* entity, const std::string& animation);
        void beginAnimation(Entity* entity, const std::string& animation);

    private:
        static Appearance* getAppearance(Entity* entity);
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
