#include "Behavior.h"
#include "Entity.h"
#include "Utility.h"
#include "VecMath.h"


namespace pyr {

#define PYR_BEHAVIOR_NAME(name)             \
    const char* getName() {                 \
        return getClassName();              \
    }                                       \
    static const char* getClassName() {     \
        return (name);                      \
    }

    /// Placeholder entity behavior class, for testing only.
    class DumbBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("dumb");
        
        DumbBehavior(const std::string& /*resource*/) {
        }

        void update(Entity* entity, float dt) {
            entity->getPos() += entity->getVel() * dt;

            entity->getVel()[0] += sin(angle) * dt / 2;
            entity->getVel()[1] += cos(angle) * dt / 2;
            angle += PI * dt / 2;
        }

        const char* getResource() {
            return "";
        }

    private:
        Zeroed<float> angle;
    };


    class NullBehavior : public Behavior {
    public:
        PYR_BEHAVIOR_NAME("null");

        NullBehavior(const std::string& /*resource*/) {
        }

        void update(Entity* entity, float dt) {
            entity->getPos() += entity->getVel() * dt;
        }

        const char* getResource() {
            return "";
        }
    };


    Behavior* instantiateBehavior(const std::string& name, const std::string& resource) {
#define TRY_TYPE(type)                          \
        if (name == type::getClassName()) {     \
            return new type(resource);          \
        }

        TRY_TYPE(DumbBehavior);
        TRY_TYPE(NullBehavior);
        return new NullBehavior(resource);
    }

}
